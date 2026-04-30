This repository contains simulation codes and raw data for the analysis in manuscript entitled "Towards Robust Laser Beam Propagation in Atmospheric Turbulence". Please feel free to use the codes and modify any parameters in accordance to your experimental setup. The code here is for modified PSD only but you can change the PSD by replacing the mathematical expression in the "ft_sh_phase_screen_modifed_exp" and "ft_phase_screen_modifed_exp" files. Any related questions can be sent to vzorba@lbl.gov or boyu.zhang@lbl.gov.

Description of contents:

1. Cn2r0.m: converting refractive index structure parameters (Cn2) to Fried parameters (r0)
2. Experimental.mat: mean values and standard deviations of beam circularities obtained in experiments
3. SI_Experimental.mat: scintillation indices obtained in experiments
4. simulation_result_type of PSD: simulation results of ellipticity and eccentricity for a specific type of PSD
5. simulation_scale_length_simulation parameter_type of PSD: simulation results of ellipticity and eccentricity with varying inner scale for a specific type of PSD [NOTE: The results obtained using the Tatarskii and mvK PSDs are very similar; therefore, their corresponding panels in Fig. 7 appear nearly identical. However, the raw data reveal subtle differences, which are comparable to the differences in prediction errors shown in Fig. 4 (f).]
6. data_pca: dataset for the PCA presented in Fig. 9
7. exp_versus_modified.m: calculating errors between numerical and experimental results
8. ft_phase_screen_modifed_exp.m: generation of phase screens with modified PSD
9. ft_sh_phase_screen_modifed_exp.m: second harmonic compensation for generation of phase screens with modified PSD
10. plot_simulation_shadederrorbar.m: plot of figures comparing numerical and experimental results of beam circularities
11. Cn2_calibration.m: calculating the Cn2 values based on different PSD expressions [NOTE: here the paramters are for the Thorlabs CPS635R probe laser only. The wavelength and beam diameter should be adjusted accordingly if using a different probe laser]
