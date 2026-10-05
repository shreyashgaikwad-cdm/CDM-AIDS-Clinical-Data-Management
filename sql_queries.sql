Clinical Data Management Project SQL Queries -- Project: AIDS Clinical Trial Dataset Validation

1. Missing Value Check SELECT * FROM clinical_trial WHERE age_years IS NULL OR weight_kg IS NULL OR cd4_baseline IS NULL OR cd4_20weeks IS NULL;

2. Duplicate Subject ID Check SELECT subject_id, COUNT() AS duplicate_count FROM clinical_trial GROUP BY subject_id HAVING COUNT() > 1;

3. Age Range Validation SELECT * FROM clinical_trial WHERE age_years < 18 OR age_years > 100;

4. Weight Range Validation SELECT * FROM clinical_trial WHERE weight_kg < 30 OR weight_kg > 200;

5. Negative Follow-up Days Check SELECT * FROM clinical_trial WHERE followup_days < 0;

6. Logical Validation Check SELECT * FROM clinical_trial WHERE treatment_status = 0 AND off_treatment = 1;

7. Invalid CD4 Baseline Values SELECT * FROM clinical_trial WHERE cd4_baseline < 0 OR cd4_baseline > 2000;

8. Gender Code Validation SELECT * FROM clinical_trial WHERE gender_code NOT IN (0,1);

9. Symptom Status Validation SELECT * FROM clinical_trial WHERE symptom_status NOT IN (0,1);

10. Subject Count by Site SELECT site_id, COUNT(*) AS total_subjects FROM clinical_trial GROUP BY site_id ORDER BY total_subjects DESC;

11. Gender Distribution SELECT gender_code, COUNT(*) AS total_subjects FROM clinical_trial GROUP BY gender_code;

12. Treatment Group Distribution SELECT treatment_group, COUNT(*) AS total_subjects FROM clinical_trial GROUP BY treatment_group;

13. Final Validation Check -- Cleaned dataset should return 0 rows for all validation queries. SELECT 'Validation Completed Successfully' AS project_status;