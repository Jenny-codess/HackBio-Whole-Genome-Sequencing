set -e
true
true
/home/rmourao/.conda/envs/spades/bin/spades-hammer /home/rmourao/jenny/hackbio/AMR_test/assembly/corrected/configs/config.info
/home/rmourao/.conda/envs/spades/bin/python3 /home/rmourao/.conda/envs/spades/share/spades/spades_pipeline/scripts/compress_all.py --input_file /home/rmourao/jenny/hackbio/AMR_test/assembly/corrected/corrected.yaml --ext_python_modules_home /home/rmourao/.conda/envs/spades/share/spades --max_threads 16 --output_dir /home/rmourao/jenny/hackbio/AMR_test/assembly/corrected --gzip_output
true
true
/home/rmourao/.conda/envs/spades/bin/spades-core /home/rmourao/jenny/hackbio/AMR_test/assembly/K21/configs/config.info
/home/rmourao/.conda/envs/spades/bin/spades-core /home/rmourao/jenny/hackbio/AMR_test/assembly/K33/configs/config.info
/home/rmourao/.conda/envs/spades/bin/spades-core /home/rmourao/jenny/hackbio/AMR_test/assembly/K55/configs/config.info
/home/rmourao/.conda/envs/spades/bin/spades-core /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/configs/config.info
/home/rmourao/.conda/envs/spades/bin/python3 /home/rmourao/.conda/envs/spades/share/spades/spades_pipeline/scripts/copy_files.py /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/before_rr.fasta /home/rmourao/jenny/hackbio/AMR_test/assembly/before_rr.fasta /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/assembly_graph_after_simplification.gfa /home/rmourao/jenny/hackbio/AMR_test/assembly/assembly_graph_after_simplification.gfa /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/final_contigs.fasta /home/rmourao/jenny/hackbio/AMR_test/assembly/contigs.fasta /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/first_pe_contigs.fasta /home/rmourao/jenny/hackbio/AMR_test/assembly/first_pe_contigs.fasta /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/strain_graph.gfa /home/rmourao/jenny/hackbio/AMR_test/assembly/strain_graph.gfa /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/scaffolds.fasta /home/rmourao/jenny/hackbio/AMR_test/assembly/scaffolds.fasta /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/scaffolds.paths /home/rmourao/jenny/hackbio/AMR_test/assembly/scaffolds.paths /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/assembly_graph_with_scaffolds.gfa /home/rmourao/jenny/hackbio/AMR_test/assembly/assembly_graph_with_scaffolds.gfa /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/assembly_graph.fastg /home/rmourao/jenny/hackbio/AMR_test/assembly/assembly_graph.fastg /home/rmourao/jenny/hackbio/AMR_test/assembly/K77/final_contigs.paths /home/rmourao/jenny/hackbio/AMR_test/assembly/contigs.paths
true
/home/rmourao/.conda/envs/spades/bin/python3 /home/rmourao/.conda/envs/spades/share/spades/spades_pipeline/scripts/breaking_scaffolds_script.py --result_scaffolds_filename /home/rmourao/jenny/hackbio/AMR_test/assembly/scaffolds.fasta --misc_dir /home/rmourao/jenny/hackbio/AMR_test/assembly/misc --threshold_for_breaking_scaffolds 3
true
