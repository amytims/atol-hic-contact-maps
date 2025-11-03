process PREPARE_PRETEXTMAP_INPUT {

    input:
    path fai

    output:
    path "*pairs.gz", emit: pairs

    when:
    task.ext.when == null || task.ext.when


    script:
    def args = task.ext.args ?: ''
    """
    prepare_pretext.sh $fai "pairsfile.pairs" | gzip -c > "pairsfile.pairs.gz"

    """


}