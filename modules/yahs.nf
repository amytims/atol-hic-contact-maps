process YAHS {

    input:
    path fasta
    path fai
    path bed

    output:
    path("*scaffolds_final.fa") , emit: scaffolds_fasta
    path("*scaffolds_final.agp"), emit: scaffolds_agp
    path("*bin")                , emit: binary

    script:
    def args = params.yahs_params ?: ''
    def prefix = params.yahs_prefix

    """
    yahs $args \\
        -o $prefix \\
        ${args} \\
        $fasta \\
        $bed
    """
}