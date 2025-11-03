process PREPARE_PRETEXTMAP_INPUT {

    input:
    path fai
    path aln

    output:
    path "*pairs.gz", emit: pairs

    when:
    task.ext.when == null || task.ext.when


    script:
    def args = task.ext.args ?: ''
    """
    prepare_pretext.sh $fai $aln | gzip -c > "pairsfile.pairs.gz"

    """


}