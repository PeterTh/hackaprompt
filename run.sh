source venv/bin/activate
ln -f -s $2 config.yml
CUDA_VISIBLE_DEVICES=$1 python main.py
