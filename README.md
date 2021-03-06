# What is transitland-matlab-audiolizer?
Turn [transitland-processing-animation](https://github.com/transitland/transitland-processing-animation) data into music!


A simple Matlab tool to audiolize transit data. It can code three different transit modalities such as subways, streetcars and buses into pitch, tempo, and volume to produce music from data. 

Here's a __demo__: https://youtu.be/QAK1Z8-vb6g

# How to use

1. Follow the instructions in [transitland-processing-animation](https://github.com/transitland/transitland-processing-animation) to generate vehicle counts for your transit agency of choice. In this example I used the following command:
```
python transitflow.py --name=bart --operator=o-dpz8-ttc --date=2017-10-23
```
2. Place the .csv files of the three modalities of transit data (i.e. bus, subway, streetcar) into the ```vehicle_counts``` folder
3. run ```transitland_music.m```
4. Listen to output that is produced in ```output.wav``` within the folder ```vehicle_counts`` folder (or use the Octobre 23/2017 TTC vehicle counts that are already there)

# Read more
Read my blog-post on this work to [learn more](https://rami-codes.github.io/2017/11/07/transitland-audiolizer/)

# License
Released under MIT License. Feel free to contribute or fork.
