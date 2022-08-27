module LanguageServer
  module Protocol
    module Interface
      #
      # The result of a document diagnostic pull request. A report can
      # either be a full report containing all diagnostics for the
      # requested document or an unchanged report indicating that nothing
      # has changed in terms of diagnostics in comparison to the last
      # pull request.
      #
      # @since 3.17.0
      #
      class DocumentDiagnosticReport
        def initialize(related_documents: nil, kind:, result_id: nil, items:)
          @attributes = {}

          @attributes[:relatedDocuments] = related_documents if related_documents
          @attributes[:kind] = kind
          @attributes[:resultId] = result_id if result_id
          @attributes[:items] = items

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
        # @return [DocumentUri => FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport | nil]
        def related_documents
          attributes.fetch(:relatedDocuments)
        end

        #
        # A full document diagnostic report.
        #
        # @return ["full"]
        def kind
          attributes.fetch(:kind)
        end

        #
        # An optional result id. If provided it will
        # be sent on the next diagnostic request for the
        # same document.
        #
        # @return [string | nil]
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
