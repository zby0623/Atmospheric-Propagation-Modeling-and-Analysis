# Atmospheric-Propagation-Modeling-and-Analysis
This repository contains simulation codes and raw data for the analysis in manuscript entitled "Towards Robust Laser Beam Propagation in Atmospheric Turbulence". Please feel free to use the codes and modify any parameters in accordance to your experimental setup. The code here is for modified PSD only but you can change the PSD by replacing the mathematical expression in the "ft_sh_phase_screen_modifed_exp" and "ft_phase_screen_modifed_exp" files. Any related questions can be sent to vzorba@lbl.gov or boyu.zhang@lbl.gov.

Description of contents:
1. Cn2r0.m: converting refractive index structure parameters (Cn2) to Fried parameters (r0)
2. Experimental.mat: mean values and standard deviations of beam circularities obtained in experiments
3. SI_Experimental.mat: scintillation indices obtained in experiments
4. VortexTurbulence_loopversion_modified.m: simulation of atmospheric propagation with modified PSD
5. exp_versus_modified.m: calculating errors between numerical and experimental results
6. ft2.m: 2-dimensional Fourier transform
7. ift2.m: 2-dimensional inverse Fourier transform
8. ft_phase_screen_modifed_exp.m: generation of phase screens with modified PSD
9. ft_sh_phase_screen_modifed_exp.m: second harmonic compensation for generation of phase screens with modified PSD
10. plot_simulation_shadederrorbar.m: plot of figures comparing numerical and experimental results of beam circularities
