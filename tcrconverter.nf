#!/usr/bin/env nextflow

params.input = "/content/tcrconvert/tcrconvert/examples/tenx.csv"
params.output_dir = "/content/"

println "TCR input: $params.input"
println "TCR output directory: $params.output_dir"

process convertTCR {
    input:
    path input

    output:
    path "out.tsv"

    publishDir params.output_dir, mode: 'copy'

    script:
    """
    tcrconvert convert -i $input -o /content/out.tsv --frm tenx --to adaptive
    """
}

workflow {
    convert_ch = convertTCR(params.input)
}