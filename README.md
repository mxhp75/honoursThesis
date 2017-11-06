# honoursThesis
## All R Markdown scripts for the final thesis

** All files currently on my VM **

Includes
### testAlign.sh
  - Bash script for the test alignment using secondary pipeline
    + Adapter trimming = cutadapt
    + Seqence alignment = STAR
    + Known small RNA quantification = SeqCluster
    + Novel miRNA prediction = miRDeep2
    + Other small RNA quantification = SeqBuster
### placentaDifferentialExpression.Rmd
 - Placenta Differential Expression analysis between female and male-bearing pregnancy
    + filtering and normalisation in edgeR
    + lm in limma
    + volcano plots
### placentaDifferentialExpressionHypoxic.Rmd
  - Placenta Differential Expression analysis between low and normoxic oxygen environment 
    + filtering and normalisation in edgeR
    + lm in limma
    + volcano plots
### placentaProfile.Rmd
  - Global Placenta Expression Profile
    + filtering and normalisation in edgeR
    + Heat maps of expression (lcpm)
### plasmaDifferentialExpression.Rmd
  - Maternal Plasma Differential Expression analysis between female and male-bearing pregnancy
    + filtering and normalisation in edgeR
    + lm in limma
    + volcano plots
### plasmaDifferentialExpression.Rmd
  - Maternal Plasma Differential Expression analysis between low and normoxic oxygen environment
    + filtering and normalisation in edgeR
    + lm in limma
    + volcano plots
### plasmaProfile.Rmd
  - Global Placenta Expression Profile
    + filtering and normalisation in edgeR
    + Heat maps of expression (lcpm)
### C19MC.Rmd
  - Sub set of placenta and plasma expression profiles with only miRNA from the chromosome 19 mega cluster
    + filtering and normalisation in edgeR
    + Heat maps of expression (lcpm)
### miR_371_3.Rmd
  - Sub set of placenta and plasma expression profiles with only miRNA from the chromosome 19 cluster miR-371-3
    + filtering and normalisation in edgeR
    + Heat maps of expression (lcpm)
### C14MC.Rmd
  - Sub set of placenta and plasma expression profiles with only miRNA from the chromosome 14 mega cluster
    + filtering and normalisation in edgeR
    + Heat maps of expression (lcpm)
### allClusterProfile.Rmd
  - Sub set of placenta and plasma expression profiles with chromosome 14 and 19 clusters combined
    + filtering and normalisation in edgeR
    + Heat maps of expression (lcpm)
    + correlation
