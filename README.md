# egfr-inhibitor-prediction
Modleing project - 2nd semester
Project title: “Using the Random Forest algorithm to predict the activity of novel EGFR inhibitors in lung cancer therapy”

Background
Lung cancer, primarily non-small cell lung cancer (NSCLC), remains a leading global cause of mortality. While traditional treatments persist, targeted therapy focusing on the epidermal growth factor receptor (EGFR) is increasingly vital. Mutations in the EGFR gene lead to constitutive receptor activity and uncontrolled cell proliferation. However, rapidly evolving drug resistance necessitates the discovery of novel inhibitors. Machine learning, specifically the Random Forest algorithm, enables efficient virtual screening of chemical databases to predict the potency of molecules against resistant EGFR variants.

Research Question

Can a machine learning algorithm based on Random Forests accurately predict the inhibitory potency (pIC50 value) of novel chemical compounds against the mutated EGFR protein by analyzing exclusively their two-dimensional structure?
Hypothesis: 
I hypothesize that the Random Forest model will successfully identify hidden, non-linear relationships between the chemical structure and the biological activity of the drug. Furthermore, I hypothesize that by utilizing an ensemble of decision trees, this model will demonstrate significantly greater stability and resistance to overfitting than simpler baseline models, such as Multiple Linear Regression or a single, classic decision tree. 

Proposed Analysis 

To conduct this analysis, I will use the publicly available ChEMBL pharmacological database. I will retrieve a dataset of small chemical molecules that have been tested for their inhibition of the mutated EGFR protein. The key information extracted from the database will be: the one-dimensional representation of the chemical structure (SMILES format) and the empirically measured drug potency, converted to a logarithmic scale (pIC50 value). 

Planned pipeline:
Preprocessing: Raw data from the ChEMBL database will be rigorously filtered by standard type and standardized to uniform units before calculating the pIC50. Following the removal of duplicates and missing values, I will use the RDKit cheminformatics library to convert the text-based SMILES structures into binary vectors, known as molecular fingerprints. These will serve as the mathematical input features for the model.
Machine Learning Modeling: I will use the scikit-learn library to train a regression algorithm based on Random Forests. The model will predict the pIC50 value based on the input fingerprints.
Model Evaluation and Tuning: To prevent overfitting and assess true generalizability, I will apply cross-validation on the training set and perform a hyperparameter grid search to find the optimal configuration of the decision trees.
Workflow Automation: The entire analytical pipeline will be defined and automated using the Snakemake workflow management system, ensuring the full reproducibility of the experiment.

4. Expected Output:
The project will deliver a reproducible GitHub repository with a Snakemake pipeline. Scientific outputs include a validated predictive model and Feature Importance plots to identify structural fragments key to EGFR inhibition. 

5. Sources
C. Sha and P. C. Lee; “EGFR-Targeted Therapies: A Literature Review”; J. Clin. Med. 2024; doi: https://doi.org/10.3390/jcm13216391
M. N. Al-Mhanna, S. A. Ghafoor, et al.; "EGFRAP: a predictive machine learning model for assessing small molecule activity against the epidermal growth factor receptor"; Journal of Biomolecular Structure and Dynamics, 2024; doi: https://doi.org/10.1080/07391102.2024.2384210 
A. M. Gouda, et al.; "Machine Learning-Based Approach to Developing Potent EGFR Inhibitors for Breast Cancer Design, Synthesis, and In Vitro Evaluation"; ACS Omega, 2023; doi: https://doi.org/10.1021/acsomega.3c02799 
S. S. A. Ghouri, et al.; "In silico ADMET, virtual screening and machine learning study of EGFR inhibitors"; bioRxiv, 2023; doi: https://doi.org/10.1101/2023.09.05.556125 
