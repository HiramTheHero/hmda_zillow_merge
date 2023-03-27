# Example shows MA to CO
# To change to another state:
# Find "/MA/" replace with "/CO/"
# Find "25_" replace with "08_"

mkdir ./data/MA/zillow_data
mkdir ./data/MA/zillow_data/data_files

# You need to download the Zillow Datafiles from the Zillow Server.
# Current data: https://zillow.exavault.com/share/view/1u1l8-6wy324k8
# Password: zgtx20210104!1115
# Historical data: https://zillow.exavault.com/share/view/i3og-f6so9cjx
# Password: zgtx20210104!1001

# States are marked by their FIPS Code.
# Then name the downloaded files in the following format.

# ## = State FIPS Code
# ######## - File name on Zillow.
# ./data/MA/zillow_data/##_########.zip

# MA For Example:

# ./data/MA/zillow_data/25.zip              <- For the Historical Data
# ./data/MA/zillow_data/25_20181230.zip
# ./data/MA/zillow_data/25_20190319.zip <- Avoid this one. It has errors in it.
# ./data/MA/zillow_data/25_20190616.zip
# ./data/MA/zillow_data/25_20190918.zip
# ./data/MA/zillow_data/25_20191009.zip
# ./data/MA/zillow_data/25_20200102.zip
# ./data/MA/zillow_data/25_20200407.zip
# ./data/MA/zillow_data/25_20200811.zip
# ./data/MA/zillow_data/25_20201012.zip
# ./data/MA/zillow_data/25_20210111.zip
# ./data/MA/zillow_data/25_20210405.zip
# ./data/MA/zillow_data/25_20210802.zip
# ./data/MA/zillow_data/25_20211018.zip
# ./data/MA/zillow_data/25_20220429.zip
# ./data/MA/zillow_data/Add more files here if more is uploaded...

7z l data/MA/zillow_data/25.zip 

7z x data/MA/zillow_data/25.zip "ZAsmt\Main.txt" -so > data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20181230.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20190616.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20190918.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20191009.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20200102.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20200407.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20200811.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20201012.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20210111.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20210405.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20210802.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20211018.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv
7z x data/MA/zillow_data/25_20220429.zip "ZAsmt\Main.txt" -so >> data/MA/zillow_data/data_files/Asmt_Main.csv

7z x data/MA/zillow_data/25.zip "ZAsmt\Value.txt" -so > data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20181230.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20190616.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20190918.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20191009.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20200102.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20200407.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20200811.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20201012.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20210111.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20210405.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20210802.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20211018.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv
7z x data/MA/zillow_data/25_20220429.zip "ZAsmt\Value.txt" -so >> data/MA/zillow_data/data_files/Asmt_Value.csv

# The Trans data in the latest file contains the most recent information. So the older files aren't needed.
7z x data/MA/zillow_data/25_20220429.zip "ZTrans\Main.txt" -so >> data/MA/zillow_data/data_files/Trans_Main.csv
7z x data/MA/zillow_data/25_20220429.zip "ZTrans\PropertyInfo.txt" -so >> data/MA/zillow_data/data_files/Trans_PropertyInfo.csv

mkdir ./data/MA/zillow_data/zipped_files
mv ./data/MA/zillow_data/*.zip ./data/MA/zillow_data/zipped_files

