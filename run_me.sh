#installing the required plug-ins

pip install -r requirements.txt


#loading data files

#REALSumm loading
cd dataloader
wget -O src.txt "https://drive.google.com/uc?export=download&id=1z1_i3cCQOd-1PWfaoFwO34YgCvdJemH7"
wget -O abs.pkl "https://github.com/neulab/REALSumm/blob/master/scores_dicts/abs.pkl?raw=true"
wget -O ext.pkl "https://github.com/neulab/REALSumm/blob/master/scores_dicts/ext.pkl?raw=true"

#SUMMEval loading

mkdir -p cnndm
python3 -m pip install gdown 
gdown "https://drive.google.com/u/0/uc?export=download&confirm=Fiu7&id=0BwmD_VLjROrfTHk4NFg2SndKcjQ"

gdown "https://drive.google.com/u/0/uc?export=download&confirm=0051&id=0BwmD_VLjROrfM1BxdkxVaTY2bWs"

tar -xvzf cnn_stories.tgz -C cnndm

tar -xvzf dailymail_stories.tgz -C cnndm

wget -O summeval_annotations.aligned.scored.jsonl "https://drive.google.com/u/0/uc?id=1d2Iaz3jNraURP1i7CfTqPIj8REZMJ3tS&export=download"

python3 pair_data.py --data_annotations summeval_annotations.aligned.scored.jsonl --story_files .

#Newsroom is already loaded

#return to previous folder

cd ..

##Direct commands from experiments.sh

mkdir results
python3 -c "import newsroom; newsroom.main()" # On Newsroom
python3 -c "import realsumm; realsumm.main('abs')" # On RealSumm's abstractive subset
python3 -c "import realsumm; realsumm.main('ext')" # On RealSumm's extractive subset
python3 -c "import summeval; summeval.main()" # On SummEval

