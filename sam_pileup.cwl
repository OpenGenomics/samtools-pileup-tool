cwlVersion: v1.0
class: CommandLineTool
label: SamTools Pileup
baseCommand: ["samtools", "mpileup", "-o", "output.pileup"]
requirements:
  - class: "DockerRequirement"
    dockerPull: "opengenomics/samtools-pileup:latest"
# samtools mpileup  -B  -q 1  -f reference.fa > output
inputs:
  
  noBaq:
    type: boolean
    doc: disable BAQ (per-Base Alignment Quality)
    default: False
    inputBinding:
      prefix: "-B"

  minMapQ:
    doc:   -q, --min-MQ INT        skip alignments with mapQ smaller than INT [0]
    type: int
    default: 0
    inputBinding:
      prefix: "-q"
  
  reference:
    type: File
    inputBinding:
      prefix: -f
    secondaryFiles:
      - .fai
      - .gzi

  input:
    type: File
    inputBinding:
      position: 1
    secondaryFiles:
      - .bai

outputs:
  output:
    type: File
    outputBinding:
      glob: output.pileup

