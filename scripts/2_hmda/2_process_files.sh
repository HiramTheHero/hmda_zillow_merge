
for f in ./data/hmda_data/lar_zipped/*.zip;
do
FILE="$f"
FILEWITHEXT=$(basename -- "$FILE")
JUSTFILE=${FILEWITHEXT%.zip}
  unzip -p "$f" > "./data/hmda_data/lar_data/$JUSTFILE.txt" &
done

wait

cp data/hmda_data/lar_zipped/lar_2017.txt data/hmda_data/lar_data/lar_2017.txt

mv data/hmda_data/lar_data/lar_2014.txt data/hmda_data/lar_data/lar_2014.csv
mv data/hmda_data/lar_data/lar_2015.txt data/hmda_data/lar_data/lar_2015.csv
mv data/hmda_data/lar_data/lar_2016.txt data/hmda_data/lar_data/lar_2016.csv
mv data/hmda_data/lar_data/lar_2017.txt data/hmda_data/lar_data/lar_2017.csv
mv data/hmda_data/lar_data/lar_2018.txt data/hmda_data/lar_data/lar_2018.csv
mv data/hmda_data/lar_data/lar_2019.txt data/hmda_data/lar_data/lar_2019.csv
mv data/hmda_data/lar_data/lar_2020.txt data/hmda_data/lar_data/lar_2020.csv

for f in ./data/hmda_data/panel_zipped/*.zip;
do
FILE="$f"
FILEWITHEXT=$(basename -- "$FILE")
JUSTFILE=${FILEWITHEXT%.zip}
  unzip -p "$f" > "./data/hmda_data/panel_data/$JUSTFILE.txt" &
done

wait

mv ./data/hmda_data/panel_zipped/*.txt ./data/hmda_data/panel_data

cp data/hmda_data/panel_data/panel_1994.txt data/hmda_data/panel_zipped/panel_1994.txt
cp data/hmda_data/panel_data/panel_1995.txt data/hmda_data/panel_zipped/panel_1995.txt
cp data/hmda_data/panel_data/panel_1996.txt data/hmda_data/panel_zipped/panel_1996.txt
cp data/hmda_data/panel_data/panel_1997.txt data/hmda_data/panel_zipped/panel_1997.txt
cp data/hmda_data/panel_data/panel_1998.txt data/hmda_data/panel_zipped/panel_1998.txt
cp data/hmda_data/panel_data/panel_1999.txt data/hmda_data/panel_zipped/panel_1999.txt
cp data/hmda_data/panel_data/panel_2000.txt data/hmda_data/panel_zipped/panel_2000.txt

cp data/hmda_data/panel_data/panel_2001.txt data/hmda_data/panel_zipped/panel_2001.txt
cp data/hmda_data/panel_data/panel_2002.txt data/hmda_data/panel_zipped/panel_2002.txt
cp data/hmda_data/panel_data/panel_2003.txt data/hmda_data/panel_zipped/panel_2003.txt
cp data/hmda_data/panel_data/panel_2004.txt data/hmda_data/panel_zipped/panel_2004.txt
cp data/hmda_data/panel_data/panel_2005.txt data/hmda_data/panel_zipped/panel_2005.txt

cp data/hmda_data/panel_data/panel_2006.txt data/hmda_data/panel_zipped/panel_2006.txt
cp data/hmda_data/panel_data/panel_2007.txt data/hmda_data/panel_zipped/panel_2007.txt
cp data/hmda_data/panel_data/panel_2008.txt data/hmda_data/panel_zipped/panel_2008.txt
cp data/hmda_data/panel_data/panel_2009.txt data/hmda_data/panel_zipped/panel_2009.txt
cp data/hmda_data/panel_data/panel_2010.txt data/hmda_data/panel_zipped/panel_2010.txt
cp data/hmda_data/panel_data/panel_2011.txt data/hmda_data/panel_zipped/panel_2011.txt

cp data/hmda_data/panel_data/panel_2012.txt data/hmda_data/panel_zipped/panel_2012.txt
cp data/hmda_data/panel_data/panel_2013.txt data/hmda_data/panel_zipped/panel_2013.txt

mv data/hmda_data/panel_data/panel_2017.txt data/hmda_data/panel_data/panel_2017.csv
mv data/hmda_data/panel_data/panel_2018.txt data/hmda_data/panel_data/panel_2018.csv
mv data/hmda_data/panel_data/panel_2019.txt data/hmda_data/panel_data/panel_2019.csv
mv data/hmda_data/panel_data/panel_2020.txt data/hmda_data/panel_data/panel_2020.csv



