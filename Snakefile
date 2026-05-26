rule all:
    input:
        "data/final_model_results.csv"

rule data_acquisition:
    output:
        "data/egfr_raw_data.csv"
    shell:
        "jupyter nbconvert --to notebook --execute notebooks/01_data_acquisition.ipynb"

rule feature_engineering:
    input:
        "data/egfr_raw_data.csv"
    output:
        "data/egfr_with_fingerprints.csv"
    shell:
        "jupyter nbconvert --to notebook --execute notebooks/02_feature_engineering.ipynb"

rule model_training:
    input:
        "data/egfr_with_fingerprints.csv"
    output:
        "data/final_model_results.csv"
    shell:
        "jupyter nbconvert --to notebook --execute notebooks/03_model_training.ipynb"
