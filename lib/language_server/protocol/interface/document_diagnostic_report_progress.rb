module LanguageServer
  module Protocol
    module Interface
      #
      # The document diagnostic report used when reporting partial result.
      #
      # When using partial results, the first literal sent needs to be a
      # DocumentDiagnosticReport providing the diagnostics on the document
      # followed by n DocumentDiagnosticReportPartialResult literals providing
      # the diagnostics for related documents.
      #
      # ```
      # DocumentDiagnosticReport
      # DocumentDiagnosticReportPartialResult
      # DocumentDiagnosticReportPartialResult
      # ...
      # ```
      #
      # @since 3.18.1
      #
      class DocumentDiagnosticReportProgress
        def initialize(related_documents: nil, kind: nil, result_id: nil, items: nil)
          @attributes = {}

          @attributes[:relatedDocuments] = related_documents unless related_documents.nil?
          @attributes[:kind] = kind unless kind.nil?
          @attributes[:resultId] = result_id unless result_id.nil?
          @attributes[:items] = items unless items.nil?

          @attributes.freeze
        end

        #
        # Diagnostics of related documents. This information is useful
        # in programming languages where code in a file A can generate
        # diagnostics in a file B which A depends on. An example of
        # such a language is C/C++ where marco definitions in a file
        # a.cpp and result in errors in a header file b.hpp.
        #
        # @since 3.17.0
        #
        # @return [DocumentUri => FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport]
        def related_documents
          attributes.fetch(:relatedDocuments)
        end

        #
        # A full document diagnostic report.
        #
        # --- OR ---
        #
        # A document diagnostic report indicating
        # no changes to the last result. A server can
        # only return `unchanged` if result ids are
        # provided.
        #
        # @return ["full" | "unchanged"]
        def kind
          attributes.fetch(:kind)
        end

        #
        # An optional result id. If provided it will
        # be sent on the next diagnostic request for the
        # same document.
        #
        # --- OR ---
        #
        # A result id which will be sent on the next
        # diagnostic request for the same document.
        #
        # @return [string]
        def result_id
          attributes.fetch(:resultId)
        end

        #
        # The actual items.
        #
        # @return [Diagnostic[]]
        def items
          attributes.fetch(:items)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
