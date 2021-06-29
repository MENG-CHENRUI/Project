import pandas as pd
import numpy as np
import openpyxl
import os
import tkinter as tk
import tkinter.messagebox
from tkinter import filedialog, dialog
import shutil
import time
import threading

from pathlib import Path

window = tk.Tk()
window.title('Python_Automation_tool')  # 标题
window.geometry('500x500')  # 窗口尺寸
 
file_path = ''
file_text = ''

#settings of window
class settings:
    def __init__(self, width, height,fontsize):
        self.width = width
        self.height = height
        self.fontsize = fontsize

#创建log窗口
display_settings=settings(80,20,8)

text1 = tk.Text(window, width=display_settings.width, 
                height=display_settings.height, bg='orange', 
                font=('Arial', display_settings.fontsize))
text1.pack()

def open_file():
    '''
    打开文件
    :return:
    '''
    global folder_dir
    folder_dir = filedialog.askdirectory()
    print(folder_dir)
    if folder_dir!= "":
        text1.insert('insert', folder_dir+"を選択した\n")
    else:
        text1.insert('insert', "フォルダーを選択しなかった、もう一度フォルダーを選択してください。\n")
        
def Preprocess(filename,index,file_num):
    
    file_path = folder_dir+"/"+filename
    print(file_path)
    
    #打印到橘黄色的显示框
    text1.insert('insert', file_path+"\n")
    
    #获取每个excel文件，获取excel文件的开头，汽车的VIN等数据，可优化性能！
    try:
        df = pd.read_excel(file_path)
        data = df.columns.values[0]
        infolist = data.split()
        VIN = infolist[infolist.index("VIN:")+1]
        if ("PRODUCTNUMBER:" in infolist):
            ProNum = infolist[infolist.index("PRODUCTNUMBER:")+1]
        else:
            ProNum = infolist[infolist.index("ProdNo.:")+1]
        if ("MODEL:" in infolist):
            Model = infolist[infolist.index("MODEL:")+1]
        else:
            Model = infolist[infolist.index("Model:")+1]
            
        #获取车的检测时间 
        infolist2=[x.lower() for x in infolist if isinstance(x,str)]
        if ("teststart:" in infolist2):
            StartDate = infolist[infolist2.index("teststart:")+1]
        else:
            StartDate = infolist[infolist2.index("start:")+1]
        if ("testend:" in infolist2):
            EndDate = infolist[infolist2.index("testend:")+1]
        else:
            EndDate = infolist[infolist2.index("end:")+1]
        #表格的前处理
        df = pd.read_excel(file_path,header=1)
        df = df.drop(df.index[len(df)-1])
        df = df[["Component","Result","Result Value "]]
        df = df.drop_duplicates(subset='Component')
        
        if index==0:
            global result_df
            result_df=pd.DataFrame(columns=['Component'])
        result_df = pd.merge(result_df, df, how = "outer", left_on='Component', right_on='Component')
        print(result_df.shape)
        Carinfo = [ProNum,VIN,Model,StartDate,EndDate]
    except:
        tkinter.messagebox.showerror('Error','元データの形が変わりました')
    
    if index==file_num-1:
        return Carinfo,result_df
    return Carinfo

def read_file():
    if folder_dir!="":
        text1.insert('insert', "データのまとめ処理開始...\n")
        
        if file_path is not None:
            Carinfo_list=[]
            text1.insert('insert', "データの読み込み開始...\n")
            
            #获取文件夹下的excel文件数目
            file_num=0
            for parents, dirnames, filenames in os.walk(folder_dir):
                for filename in filenames:
                    file_num += 1
            
            #读取所有数据并做前处理
            file_num = file_num-1 #file_nu为需要处理的文件数，所以要减去URLInfo文件
            for parents, dirnames, filenames in os.walk(folder_dir):
                for index,filename in enumerate(filenames):
                    if filename != "URL Info.xlsx":
                        Carinfo_list.append(Preprocess(filename,index,file_num))
            text1.insert('insert', "...を読み込みました。\n")
    
        #最后一次Preprocess中返回了resultdf，需要单独提出来
        global StartDate
        global EndDate
        multiple = Carinfo_list
        
        if file_num == 1:
            resultdf = Carinfo_list[0][1]
            Carinfo_list = [(Carinfo_list[0][0])]
        else:
            resultdf = multiple[-1][1]
            old_Carinfo_list = multiple[0:-1]
            old_Carinfo_list.append(multiple[-1][0])
            Carinfo_list = old_Carinfo_list
            
        #找出所有文件中，车的检测期间
        StartDate = Carinfo_list[0][3]
        EndDate = Carinfo_list[0][4]
        fmt = "%m/%d/%Y"
        for item in Carinfo_list:
            if (time.strptime(item[3], fmt) <= time.strptime(StartDate, fmt)):
                StartDate = item[3]
            if(time.strptime(item[4], fmt) >= time.strptime(EndDate, fmt)):
                EndDate = item[4]
        StartDate = str(StartDate).split('/')
        EndDate = str(EndDate).split('/')
        StartDate = StartDate[2]+"-"+StartDate[0]+"-"+StartDate[1]
        EndDate = EndDate[2]+"-"+EndDate[0]+"-"+EndDate[1]
        return Carinfo_list,resultdf
    else:
        tkinter.messagebox.showerror('Error','フォルダーを選択しなかった、もう一度フォルダーを選択してください。')
            
def summerize_file():
    Carinfo_list,result_df = read_file()
    new_folder_dir = Path(folder_dir+"/../result")
    if not new_folder_dir.exists():
        os.mkdir(folder_dir+"/../result")
    file_name =  "Master "+ StartDate + " - "+ EndDate

    #判断有没有和新生成的excel文件重名的文件
    try:
        filename_list=[]
        #获取result文件夹下文件名
        for parents, dirnames, filenames in os.walk(folder_dir+"/../result"):
            for filename in filenames:
                filename_list.append(filename)

        #判断有没有和新生成的excel文件重名的文件,如果有重名的，则生成-> 原名(1).xlsm
        new_file_name = file_name+".xlsm"
        global result_file_name
        if new_file_name not in filename_list:
            shutil.copyfile(folder_dir+"/../resources/Master.xlsm", folder_dir+"/../result/"+file_name + ".xlsm")
            text1.insert('insert', "resultフォルダーに"+file_name + ".xlsm"+"を生成した。\n\n")
            result_file_name=file_name+ ".xlsm"
        else:
            n=0
            while (new_file_name in filename_list): 
                n=n+1
                new_file_name = file_name+" ("+str(n)+")"+".xlsm"
            result_file_name=new_file_name
            shutil.copyfile(folder_dir+"/../resources/Master.xlsm", folder_dir+"/../result/"+new_file_name)
            text1.insert('insert', "resultフォルダーに"+new_file_name+"を生成した。\n\n")
    except:
        text1.insert('insert', "resourcesフォルダーにMaster.xlsmが見つからない\n")
        tkinter.messagebox.showerror('Error','resourcesフォルダーにMaster.xlsmが見つからない')
    text1.insert('insert', "データを書き込んでいます、Masterファイルを開かないでください\n")
    WriteDataToExcel(Carinfo_list,folder_dir,result_file_name,result_df)
    
def WriteDataToExcel(Carinfo_list,folder_dir,result_file_name,result_df):
    
    excel_file_path=folder_dir+"/../result/"+result_file_name
    writer = pd.ExcelWriter(excel_file_path, engine='openpyxl')
    writer.book = openpyxl.load_workbook(excel_file_path, keep_vba= True)
    writer.sheets = {ws.title: ws for ws in writer.book.worksheets}
    
    #获取ECU信息的ECU_df
    ECU_df =pd.DataFrame(columns=["ECU"])
    print(type(result_df))
    for index,item in enumerate(result_df["Component"]):
        ECU_infolist = item.split(":")
        ECU_info=ECU_infolist[0]
        if ECU_info.isupper():
            ECU_df.loc[index,"ECU"] = ECU_info
        else:
            ECU_df.loc[index,"ECU"] = "None"
    result_df = pd.concat([ECU_df, result_df], axis=1)
    
    #URL_Info以字典形式存储，[Filename1:"URL1",Filename2:"URL2", ....]
    df_URLinfo = pd.read_excel(folder_dir+"/URL Info.xlsx")
    dic_URLinfo = df_URLinfo.set_index(['FILE NAME'])['URL'].to_dict()
    
    #获取原始数据的文件名，填入Master的第5行
    filename_list=[]
    for parents, dirnames, filenames in os.walk(folder_dir):
            for filename in filenames:
                filename_list.append(filename[:-5])
    
    #删除URL_info这个filename
    filename_list.remove("URL Info")
    #创建carinfo_df 来保存车辆相关数据
    carinfo_df = pd.DataFrame(columns=[x for x in range(2*len(filename_list))],index=['Pro', 'VIN', 'MODLE', "LINK", "filename","Resultnames"])
    for index,item in enumerate(Carinfo_list):
        carinfo_df.loc['Pro',2*index] = item[0]
        carinfo_df.loc['VIN',2*index] = item[1]
        carinfo_df.loc['MODLE',2*index] = item[2]
        carinfo_df.loc['Resultnames',2*index] = "Result"
        carinfo_df.loc['Resultnames',2*index+1] = "Result Value"
    
    #加入link和filename
    for index,item in enumerate(filename_list):
        carinfo_df.loc['LINK',2*index] = dic_URLinfo[item]
        carinfo_df.loc['filename',2*index] = item
        
    #写入excel文件中
    result_df.to_excel(writer,sheet_name="Master",index=True,header=None,startrow=6,startcol=0)
    carinfo_df.to_excel(writer,sheet_name="Master",index=False,header=None,startrow=0,startcol=3)
    writer.save()
    writer.close()

#多线程防止点击按钮后卡死
class MultiThread(threading.Thread):
    def __init__(self, func):
        super().__init__()
        self.func = func
        self.setDaemon(True)
        self.start() # 在这里开始
    
    def run(self):
        start=time.time()
        try:
            self.func()
            end=time.time()
            timeinterval = round(end-start,2)
            text1.insert('insert', "処理が完了しました！処理時間が"+str(timeinterval)+"秒です\n\n")
            tkinter.messagebox.showinfo(
            title = 'メッセージ！'
            message='処理が完了しました！処理時間が'+str(timeinterval)+'秒です')
        except:
            tkinter.messagebox.showerror('Error','問題が発生しました、管理者に問い合わせてください。')

        
bt1 = tk.Button(window, text='フォルダーを選ぶ', width=15, height=2, command=open_file)
bt1.pack()
bt2 = tk.Button(window, text='データまとめ開始', width=15, height=2, command=lambda :MultiThread(summerize_file))
bt2.pack()

try:
    window.iconbitmap("resources\\icon.ico")
except:
    tkinter.messagebox.showerror('Error','resourcesフォルダーにicon.icoが見つからない')
window.mainloop()  # 显示