// inputs needed: contig fasta; merged_sorted_bed file

//contigs
//bed
//sample_id
//yahs_prefix
//yahs_params

include { SAMTOOLS_FAIDX } from './modules/samtools_faidx.nf'
include { YAHS } from './modules/yahs.nf'
include { JUICER_PRE } from './modules/juicer_pre.nf'
include { PREPARE_PRETEXT_MAP_INPUT } from './modules/prepare_pretextmap_input.nf'
include { PRETEXTMAP } from './modules/pretextmap.nf'
include { PRETEXTSNAPSHOT } from './modules/pretextsnapshot.nf'

workflow {

    SAMTOOLS_FAIDX(params.contigs)

    YAHS(params.contigs, SAMTOOLS_FAIDX.out.fai, params.bed)

    JUICER_PRE(YAHS.out.binary, YAHS.out.scaffolds_agp, params.contigs)

    PREPARE_PRETEXTMAP_INPUT(JUICER_PRE.out.aln_sort, "pairs_file.pairs")

    PRETEXTMAP(PREPARE_PRETEXT_MAP_INPUT.out.pairs)

    PRETEXTSNAPSHOT(PRETEXT_MAP.out.pretext, PREPARE_PRETEXT_MAP_INPUT.out.pairs)

}