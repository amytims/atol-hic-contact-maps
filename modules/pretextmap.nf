
process PRETEXTMAP {

    input:
    path input

    output:
    tuple val(meta), path("*.pretext"), emit: pretext

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${params.sample_id}"

    """
    zcat $input | PretextMap \\
        $args \\
        -o ${params.sample_id}.pretext
    """
}