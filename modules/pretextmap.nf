
process PRETEXTMAP {

    input:
    path input

    output:
    path "*.pretext", emit: pretext

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${params.sample_id}"

    """
    zcat $input | PretextMap \\
        $args \\
        --mapq $params.pretextmap_mapq
        -o ${prefix}.pretext
    """
}