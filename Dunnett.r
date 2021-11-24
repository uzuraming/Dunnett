# ライブラリのインポート
library(multcomp)

# オプション.
# 桁数を設定してるだけ
options(digits=10)
options(scipen=10)

# ファイルパス。ここに読み込みたいパスを入れる
file_path <- 'FACS_data.csv'

# CSVから得たデータをraw_dataに代入
raw_data <- read.csv(file_path)

#--------------------------------------
# 分散分析を行う関数である aov()，
# 実際のダネット検定の計算を行う関数である glht()

# 結果の要約を表示する関数である summary()
# を一気にやって表示
#--------------------------------------

print('----------検定結果------------')
print(summary(glht(aov(Net~Conc), linfct=mcp(Conc="Dunnett"))))

# confint() コマンドを用いると信頼区間を算出することができる
print('----------信頼区間-------------')
print(confint(glht(aov(Net~Conc),linfct=mcp(Conc="Dunnett")),level=0.99))
