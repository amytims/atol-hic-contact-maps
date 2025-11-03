process PRETEXTSNAPSHOT {
    publishDir 'results'

    input:
    path pretext_map

    output:
    path '*.{jpeg,png,bmp}', emit: image

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${params.sample_id}."
    """
    PretextSnapshot \\
        $args \\
        --map $pretext_map \\
        --prefix $prefix \\
        --folder .
    """
}