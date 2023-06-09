#Importar librerias
import pandas as pd
import matplotlib.pyplot as plt
import statsmodels.api as sm
from scipy import stats
import statistics
from statistics import median
from math import isnan
from itertools import filterfalse

#Lectura de archivos
data_path = 'CalificacionesEXAVER_19-22.xlsx'
df1 = pd.read_excel(data_path, sheet_name='exa_grades (3)')

data_path = 'CalificacionesEXAVER_23.xlsx'
df2 = pd.read_excel(data_path, sheet_name='exa_grades (3)')

#Impresión de datos totales archivos
print("\n", "Archivo 1 (19-22):", "\n", df1.columns,"\n", df1.shape)
print("\n", "Archivo 2 (23):", "\n", df2.columns, "\n", df2.shape)

#Unión de archivos
dataFrame = [df1,df2]
df = pd.concat(dataFrame)
df.head
df.tail

#Impresión de unión
print("\n", "Datos unión:", "\n", df.columns, "\n", df.shape)

#Checar datos null o faltantes
print("\n", "Datos nulos:", df.isnull().sum().sum(), "\n")
#for c in df.columns:
    #print df[c].isnull()   

#Definir tipos de datos
#Variable Enroll identificador del participante
#Variable administration_date, cambiar a tipo fecha
#Variable READING, WRITING, LISTENING, ORAL numericas enteras
#Variable NIVEL categorica (3 factores, levels)
#variable FINAL tenga un valor, representa calificación final
df = df.astype({'READING': 'int32', 'WRITING': 'int32', 'LISTENING': 'int32', 'ORAL': 'int32', 'adm_administration_date': 'datetime64[ns]', 'NIVEL': 'int32'})

print("Tipos de datos:")
print(df.dtypes, "\n")

#Estadisticas descriptivas
print("Estadisticas descriptivas:")
print(df.describe, "\n")

mediaR = df['READING'].mean()
mediaW = df['WRITING'].mean()
mediaL = df['LISTENING'].mean()
mediaO = df['ORAL'].mean()

medianaR = df['READING'].median()
medianaW = df['WRITING'].median()
medianaL = df['LISTENING'].median()
medianaO = df['ORAL'].median()

modaR = df['READING'].mode()
modaW = df['WRITING'].mode()
modaL = df['LISTENING'].mode()
modaO = df['ORAL'].mode()

print("Estadisticas Generales de READING:", "\n", "Media:", mediaR, "\n", "Mediana:", medianaR, "\n", "Moda:", modaR, "\n") 
print("Estadisticas Generales de WRITING:", "\n","Media:", mediaW, "\n", "Mediana:", medianaW, "\n", "Moda:", modaW, "\n")
print("Estadisticas Generales de LISTENING:", "\n","Media:", mediaL, "\n", "Mediana:", medianaL, "\n", "Moda:", modaL, "\n")
print("Estadisticas Generales de ORAL:", "\n", "Media:", mediaO, "\n", "Mediana:", medianaO, "\n", "Moda:", modaO, "\n")

#Estadisticas descriptivas por nivel
nivel_1_READING = []
nivel_2_READING = []
nivel_3_READING = []

nivel_1_WRITING = []
nivel_2_WRITING = []
nivel_3_WRITING = []

nivel_1_LISTENING = []
nivel_2_LISTENING = []
nivel_3_LISTENING = []

nivel_1_ORAL = []
nivel_2_ORAL = []
nivel_3_ORAL = []

for row in df.itertuples():
    if(row.NIVEL == 1):
        nivel_1_READING.append(row.READING)
        nivel_1_WRITING.append(row.WRITING)
        nivel_1_LISTENING.append(row.LISTENING)
        nivel_1_ORAL.append(row.ORAL)
    if(row.NIVEL == 2):
        nivel_2_READING.append(row.READING)
        nivel_2_WRITING.append(row.WRITING)
        nivel_2_LISTENING.append(row.LISTENING)
        nivel_2_ORAL.append(row.ORAL)
    if(row.NIVEL == 3):
        nivel_3_READING.append(row.READING)
        nivel_3_WRITING.append(row.WRITING)
        nivel_3_LISTENING.append(row.LISTENING)
        nivel_3_ORAL.append(row.ORAL)

#Descriptivos agrupados por nivel
print("Nivel 1 READING:", "\n", "Media:", statistics.mean(nivel_1_READING), "\n", "Mediana:", statistics.median(nivel_1_READING), "\n", "Moda:", statistics.mode(nivel_1_READING), "\n")
print("Nivel 2 READING:", "\n", "Media:", statistics.mean(nivel_2_READING), "\n", "Mediana:", statistics.median(nivel_2_READING), "\n", "Moda:", statistics.mode(nivel_2_READING), "\n")
print("Nivel 3 READING:", "\n", "Media:", statistics.mean(nivel_3_READING), "\n", "Mediana:", statistics.median(nivel_3_READING), "\n", "Moda:", statistics.mode(nivel_3_READING), "\n")

print("Nivel 1 WRITING:", "\n", "Media:", statistics.mean(nivel_1_WRITING), "\n", "Mediana:", statistics.median(nivel_1_WRITING), "\n", "Moda:", statistics.mode(nivel_1_WRITING), "\n")
print("Nivel 2 WRITING:", "\n", "Media:", statistics.mean(nivel_2_WRITING), "\n", "Mediana:", statistics.median(nivel_2_WRITING), "\n", "Moda:", statistics.mode(nivel_2_WRITING), "\n")
print("Nivel 3 WRITING:", "\n", "Media:", statistics.mean(nivel_3_WRITING), "\n", "Mediana:", statistics.median(nivel_3_WRITING), "\n", "Moda:", statistics.mode(nivel_3_WRITING), "\n")

print("Nivel 1 LISTENING:", "\n", "Media:", statistics.mean(nivel_1_LISTENING), "\n", "Mediana:", "\n", statistics.median(nivel_1_LISTENING), "\n", "Moda:", statistics.mode(nivel_1_LISTENING), "\n")
print("Nivel 2 LISTENING:", "\n", "Media:", statistics.mean(nivel_2_LISTENING), "\n", "Mediana:", "\n", statistics.median(nivel_2_LISTENING), "\n", "Moda:", statistics.mode(nivel_2_LISTENING), "\n")
print("Nivel 3 LISTENING:", "\n", "Media:", statistics.mean(nivel_3_LISTENING), "\n", "Mediana:", "\n", statistics.median(nivel_3_LISTENING), "\n", "Moda:", statistics.mode(nivel_3_LISTENING), "\n")

print("Nivel 1 ORAL:", "\n", "Media:", statistics.mean(nivel_1_ORAL), "\n", "Mediana:", statistics.median(nivel_1_ORAL), "\n", "Moda:", statistics.mode(nivel_1_ORAL), "\n")
print("Nivel 2 ORAL:", "\n", "Media:", statistics.mean(nivel_2_ORAL), "\n", "Mediana:", statistics.median(nivel_2_ORAL), "\n", "Moda:", statistics.mode(nivel_2_ORAL), "\n")
print("Nivel 3 ORAL:", "\n", "Media:", statistics.mean(nivel_3_ORAL), "\n", "Mediana:", statistics.median(nivel_3_ORAL), "\n", "Moda:", statistics.mode(nivel_3_ORAL), "\n")

nivel1 = df.groupby(df['NIVEL'])
datosNivel1 = nivel1.get_group(1)

nivel2 = df.groupby(df['NIVEL'])
datosNivel2= nivel2.get_group(2)

nivel3 = df.groupby(df['NIVEL'])
datosNivel3 = nivel3.get_group(3)

dataFrameReading = [df['READING'], datosNivel1['READING'], datosNivel2['READING'], datosNivel3['READING']]
dfR = pd.concat(dataFrameReading)
dfR.head
dfR.tail

#Matriz de correlación (agregando FINAL) 
columnasMc = ['READING', 'WRITING', 'LISTENING', 'ORAL']
datosMc = df[columnasMc]
matrizCorr = datosMc.corr()
print(matrizCorr, "\n")
