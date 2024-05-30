#!/usr/bin/env nextflow

params.input = "/content/tcr-converter/tcrconverter/data/example_10x.csv"
params.output_dir = "/content"

println "TCR input: $params.input"
println "TCR output directory: $params.output_dir"

process convertTCR {
    input:
    path input

    output:
    path "example_out.csv"

    publishDir params.output_dir, mode: 'copy'

    script:
    """
    #!/usr/bin/env python
    import pandas as pd
    from tcrconverter import convert

    df = pd.read_csv('$input')
    converted = convert.convert_tcr(df, fmt_from='tenx', fmt_to='adaptive')
    converted.to_csv("example_out.csv", index=False)
    """
}

workflow {
    convert_ch = convertTCR(params.input)
}