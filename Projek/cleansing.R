library(RMySQL)
#Membuka koneksi
con <- dbConnect(MySQL(), user="root", password="", host="localhost",
                 dbname="data")

#Konstruksi SQL
sql <- "SELECT id, nama from test where nama like '%ibu%' or nama like '%bapak%'"

#Mengirimkan query
rs <- tryCatch(dbSendQuery(con, sql), finally = print("query ok"))

#Mengambil data
data.pelanggan <- fetch(rs, n=-1)
data.pelanggan
data.pelanggan$nama <- gsub("[^A-Za-z .,]", "", data.pelanggan$nama)
"bapak"
"ibu"
"ir"
data.pelanggan$nama <- gsub("[ ]{2,}", " ", data.pelanggan$nama)
data.pelanggan$nama <- trimws(data.pelanggan$nama, which="both")
data.pelanggan

#Menutup Koneksi
all_cons <- dbListConnections(MySQL())
for(con in all_cons) dbDisconnect(con)
