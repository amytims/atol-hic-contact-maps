process SAMTOOLS_FAIDX {

    input:
    path(fasta)

    output:
    path "*.{fa,fasta}" , emit: fa , optional: true
    path "*.fai"        , emit: fai, optional: true
    path "*.gzi"        , emit: gzi, optional: true

    script:
    def args = task.ext.args ?: ''
    """
    samtools \\
        faidx \\
        $fasta \\
        $args

    """
}