process SAMTOOLS_FAIDX {

    input:
    path(fasta)

    output:
    tuple val(meta), path ("*.{fa,fasta}") , emit: fa , optional: true
    tuple val(meta), path ("*.fai")        , emit: fai, optional: true
    tuple val(meta), path ("*.gzi")        , emit: gzi, optional: true

    script:
    def args = task.ext.args ?: ''
    """
    samtools \\
        faidx \\
        $fasta \\
        $args

    """
}