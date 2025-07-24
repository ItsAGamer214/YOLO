# YOLO


This repository contains the source code for the paper "G-Retriever: Retrieval-Augmented Generation for Textual Graph Understanding and Question Answering".

We introduce YOLO, a flexible question-answering framework targeting real-world textual graphs, applicable to multiple applications including scene graph understanding, common sense reasoning, and knowledge graph reasoning.

Check out our poster!


**WARNING**: This repository has no caches from training or pretrained pth files.
We used 2xH100s and completed our training in about 10 hours. All of the training should work given you install the packages from G-Retriever


## Setup
---

STTran and G-Retriever need to be set up separately.

First, for the environment setup. 


```
conda create --name g_retriever python=3.9 -y
conda activate g_retriever

# https://pytorch.org/get-started/locally/
conda install pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.8 -c pytorch -c nvidia

python -c "import torch; print(torch.__version__)"
python -c "import torch; print(torch.version.cuda)"
pip install pyg_lib torch_scatter torch_sparse torch_cluster torch_spline_conv -f https://data.pyg.org/whl/torch-2.0.1+cu118.html

pip install peft
pip install pandas
pip install ogb
pip install transformers
pip install wandb
pip install sentencepiece
pip install torch_geometric
pip install datasets
pip install pcst_fast
pip install gensim
pip install scipy==1.12
pip install protobuf

```

### Download the Llama 2 Model

Go to Hugging Face: https://huggingface.co/meta-llama/Llama-2-7b-hf. You will need to share your contact information with Meta to access this model.
Sign up for a Hugging Face account (if you don’t already have one).
Generate an access token: https://huggingface.co/docs/hub/en/security-tokens.
Add your token to the code file as follows:
From transformers import AutoModel
access_token = "hf_..."
model = AutoModel.from_pretrained("private/model", token=access_token)

Replace these values in G-Retriever


From here, go to STTran's and G-Retrievers respective githubs and follow their READMEs.

You need around 370GB of storage for both of the datasets combined
