# A memo rule is one that is likely to be repeated several times,
# and thus will improve the performance of the parser by not repeating
# the parsing of the rule repeatedly. Judicial application of
# this rule can improve performance of complex parsers significantly,
# but making everything memoed will have a severely negative impact
# on performance.
#
# You should not use this directly, but should instead create memoized
# rules through the Parslet.memo method. Other than memoization, it has
# exactly the same effect as an Entity rule.
class Parslet::Atoms::Memo < Parslet::Atoms::Entity
  def apply(source, context, memoize = true)
  	super(source, context, memoize)
  end
end
