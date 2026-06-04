# egfr-inhibitor-prediction

# Modleing project - 2nd semester
# Project title: “Using the Random Forest algorithm to predict the activity of novel EGFR inhibitors in lung cancer therapy”
# Katarzyna Makowska

## 1. Project Overview & Background
Lung cancer, primarily non-small cell lung cancer (NSCLC), remains a leading global cause of mortality. While targeted therapy focusing on the epidermal growth factor receptor (EGFR) is vital, mutations in the EGFR gene lead to constitutive receptor activity and uncontrolled cell proliferation. Rapidly evolving drug resistance necessitates the discovery of novel inhibitors. 
This project utilizes Machine Learning—specifically the Random Forest algorithm—to enable efficient virtual screening of chemical databases, predicting the potency of molecules against EGFR variants based exclusively on their two-dimensional chemical structure.

## 2. Research Question & Hypothesis
**Question:** Can a Random Forest-based machine learning algorithm accurately predict the inhibitory potency (pIC50 value) of novel chemical compounds against the EGFR protein by analyzing solely their 2D structure?

**Hypothesis:** The Random Forest model will successfully identify hidden, non-linear relationships between the chemical structure and biological activity. By utilizing an ensemble of decision trees, this model will demonstrate significantly greater stability, predictive power, and resistance to overfitting compared to baseline models.

## 3. Methodology & Pipeline
The entire analytical pipeline was built using Python and automated via **Snakemake**.

* **Data Acquisition & Preprocessing:** Data was retrieved from the publicly available **ChEMBL** pharmacological database. Raw data was rigorously filtered by standard type, standardized to uniform units, and converted to a logarithmic scale (pIC50). 
* **Feature Engineering:** Following the removal of duplicates and missing values, the **RDKit** cheminformatics library was used to convert text-based SMILES structures into binary vectors (Morgan Fingerprints: radius=2, 2048 bits).
* **Machine Learning Modeling:** A Random Forest Regressor (`scikit-learn`) was trained to predict the pIC50 value based on the input fingerprints.
* **Model Evaluation and Tuning:** Hyperparameter optimization was performed using `GridSearchCV` with 3-fold Cross-Validation to prevent overfitting and ensure true generalizability.

## 4. Key Results
The developed machine learning pipeline successfully modeled the structure-activity relationship of EGFR inhibitors. The optimized Random Forest model achieved excellent predictive performance on the unseen test set:
* **R-squared (R2) Score:** 0.9125
* **Root Mean Squared Error (RMSE):** 0.4278

These metrics confirm that the model accurately captures complex chemical patterns and can be reliably used for the virtual screening of novel EGFR inhibitors.

## 5. How to Run (Reproducibility)
This project is fully automated using the **Snakemake** workflow management system, ensuring complete reproducibility of the experiment. 

To view the execution plan (dry-run), execute the following command in the terminal:
```bash
snakemake -n
```

## 6. Refereances
1. C. Sha and P. C. Lee, "EGFR-Targeted Therapies: A Literature Review," J. Clin. Med., 2024. doi: 10.3390/jcm13216391.
2. A. Gupta, A. S. Thind, R. Purohit, "EGFRAP: a predictive machine learning model for assessing small molecule activity against the epidermal growth factor receptor," RSC Medical Chemistry, 2025. doi:10.1039/d5md00361j
3. H. Nada, A. R. Gul, A. Elkamhawy, "Machine Learning-Based Approach to Developing Potent EGFR Inhibitors for Breast Cancer Design, Synthesis, and In Vitro Evaluation," ACS Omega, 2023. doi: 10.1021/acsomega.3c02799.
4. R. Romero, "In silico ADMET, virtual screening and machine learning study of EGFR inhibitors," bioRxiv, 2023. doi: 10.1101/2023.09.05.556125.
5. J. Köster and S. Rahmann, "Snakemake—a scalable bioinformatics workflow engine," Bioinformatics, vol. 28, no. 19, pp. 2520–2522, 2012. doi: 10.1093/bioinformatics/bts480.
6. G. Landrum et al., "RDKit: Open-source cheminformatics", Zenodo, 2023. doi: https://doi.org/10.5281/zenodo.14535873 
7. L. Breiman, "Random Forests," Machine Learning, vol. 45, no. 1, pp. 5–32, 2001. doi: 10.1023/A:1010933404324.
