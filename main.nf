// inputs needed: contig fasta; merged_sorted_bed file

//contigs
//bed
//sample_id
//yahs_prefix
//yahs_params

include { SAMTOOLS_FAIDX as CONTIGS_FAIDX } from './modules/samtools_faidx.nf'
include { SAMTOOLS_FAIDX as SCAFFOLDS_FAIDX } from './modules/samtools_faidx.nf'
include { YAHS } from './modules/yahs.nf'
include { JUICER_PRE } from './modules/juicer_pre.nf'
include { PREPARE_PRETEXTMAP_INPUT } from './modules/prepare_pretextmap_input.nf'
include { PRETEXTMAP } from './modules/pretextmap.nf'
include { PRETEXTSNAPSHOT } from './modules/pretextsnapshot.nf'

workflow {

    CONTIGS_FAIDX(params.contigs)

    YAHS(params.contigs, CONTIGS_FAIDX.out.fai, params.bed)

    JUICER_PRE(YAHS.out.binary, YAHS.out.scaffolds_agp, CONTIGS_FAIDX.out.fai)

    SCAFFOLDS_FAIDX(YAHS.out.scaffolds_fasta)

    PREPARE_PRETEXTMAP_INPUT(SCAFFOLDS_FAIDX.out.fai, JUICER_PRE.out.aln_sort)

    PRETEXTMAP(PREPARE_PRETEXTMAP_INPUT.out.pairs)

    PRETEXTSNAPSHOT(PRETEXTMAP.out.pretext)

}