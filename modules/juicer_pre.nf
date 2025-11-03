
process JUICER_PRE {

    input:
    path binary
    path agp
    path fai

    output:
    path("*alignments_sorted.txt"), emit: pairs

    script:
    def args = task.ext.args ?: ''
    def args2 = task.ext.args2 ?: ''
    """
    juicer pre ${binary} ${agp} ${fai} ${args} | ${args2} > alignments_sorted.txt

    """
}