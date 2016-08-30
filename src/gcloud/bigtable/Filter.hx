package gcloud.bigtable;
@:jsRequire("google-cloud", "bigtable.filter") extern class Filter {
	/**
		<p>A filter takes a row as input and produces an alternate view of the row based on specified rules. For example, a row filter might trim down a row to include just the cells from columns matching a given regular expression, or might return all the cells of a row but not their values. More complicated filters can be composed out of these components to express requests such as, &quot;within every column of a particular family, give just the two most recent cells which are older than timestamp X.&quot;</p><p>There are two broad categories of filters (true filters and transformers), as well as two ways to compose simple filters into more complex ones (<a data-custom-type="bigtable/filter" data-method="interleave">bigtable/filter#interleave</a>). They work as follows:</p><p>True filters alter the input row by excluding some of its cells wholesale from the output row. An example of a true filter is the <a data-custom-type="bigtable/filter" data-method="value">bigtable/filter#value</a> filter, which excludes cells whose values don&#39;t match the specified pattern. All regex true filters use RE2 syntax (<a href="https://github.com/google/re2/wiki/Syntax">https://github.com/google/re2/wiki/Syntax</a>) and are evaluated as full matches. An important point to keep in mind is that RE2(.) is equivalent by default to RE2([^\n]), meaning that it does not match newlines. When attempting to match an arbitrary byte, you should therefore use the escape sequence &#39;\C&#39;, which may need to be further escaped as &#39;\C&#39; in your client language.</p><p>Transformers alter the input row by changing the values of some of its cells in the output, without excluding them completely. Currently, the only supported transformer is the <a data-custom-type="bigtable/filter" data-method="value">bigtable/filter#value</a> <code>strip</code> filter, which replaces every cell&#39;s value with the empty string.</p><p>The total serialized size of a filter message must not exceed 4096 bytes, and filters may not be nested within each other to a depth of more than 20.</p><p>Use the following table for the various examples found throughout the filter documentation.</p><table> <thead> <tr> <th>Row Key</th> <th style="text-align:center">follows:gwashington</th> <th style="text-align:center">follows:jadams</th> <th style="text-align:center">follows:tjefferson</th> </tr> </thead> <tbody> <tr> <td>gwashington</td> <td style="text-align:center"></td> <td style="text-align:center">1</td> <td style="text-align:center"></td> </tr> <tr> <td>tjefferson</td> <td style="text-align:center">1</td> <td style="text-align:center">1</td> <td style="text-align:center"></td> </tr> <tr> <td>jadams</td> <td style="text-align:center">1</td> <td style="text-align:center"></td> <td style="text-align:center">1</td> </tr> </tbody> </table> 
	**/
	@:selfCall
	function new();
	function all():Void;
	/**
		<p>Matches only cells from columns whose qualifiers satisfy the given RE2 regex.</p><p>Note that, since column qualifiers can contain arbitrary bytes, the &#39;\C&#39; escape sequence must be used if a true wildcard is desired. The &#39;.&#39; character will not match the new line character &#39;\n&#39;, which may be present in a binary qualifier.</p>
	**/
	function column():Void;
	/**
		<p>A filter which evaluates one of two possible filters, depending on whether or not a <code>test</code> filter outputs any cells from the input row.</p><p>IMPORTANT NOTE: The <code>test</code> filter does not execute atomically with the pass and fail filters, which may lead to inconsistent or unexpected results. Additionally, condition filters have poor performance, especially when filters are set for the fail condition.</p>
	**/
	function condition():Void;
	/**
		<p>Matches only cells from columns whose families satisfy the given RE2 regex. For technical reasons, the regex must not contain the &#39;:&#39; character, even if it is not being used as a literal. Note that, since column families cannot contain the new line character &#39;\n&#39;, it is sufficient to use &#39;.&#39; as a full wildcard when matching column family names.</p>
	**/
	function family():Void;
	/**
		<p>Applies several filters to the data in parallel and combines the results.</p><p>The elements of &quot;filters&quot; all process a copy of the input row, and the results are pooled, sorted, and combined into a single output row. If multiple cells are produced with the same column and timestamp, they will all appear in the output row in an unspecified mutual order. All interleaved filters are executed atomically.</p>
	**/
	function interleave():Void;
	/**
		<p>Applies the given label to all cells in the output row. This allows the client to determine which results were produced from which part of the filter.</p><p>Values must be at most 15 characters in length, and match the RE2 pattern [a-z0-9\-]+</p><p>Due to a technical limitation, it is not currently possible to apply multiple labels to a cell. As a result, a chain filter may have no more than one sub-filter which contains a apply label transformer. It is okay for an <a data-custom-type="bigtable/filter" data-method="interleave">bigtable/filter#interleave</a> to contain multiple apply label transformers, as they will be applied to separate copies of the input. This may be relaxed in the future.</p>
	**/
	function label():Void;
	function row():Void;
	/**
		<p>This filter is meant for advanced use only. Hook for introspection into the filter. Outputs all cells directly to the output of the read rather than to any parent filter.</p><p>Despite being excluded by the qualifier filter, a copy of every cell that reaches the sink is present in the final result.</p><p>As with an <a data-custom-type="bigtable/filter" data-method="interleave">bigtable/filter#interleave</a> filter, duplicate cells are possible, and appear in an unspecified mutual order.</p><p>Cannot be used within <a data-custom-type="bigtable/filter" data-method="condition">bigtable/filter#condition</a> filter.</p>
	**/
	function sink():Void;
	/**
		<p>Matches only cells with timestamps within the given range.</p>
	**/
	function time():Void;
	/**
		<p>Matches only cells with values that satisfy the given regular expression. Note that, since cell values can contain arbitrary bytes, the &#39;\C&#39; escape sequence must be used if a true wildcard is desired. The &#39;.&#39; character will not match the new line character &#39;\n&#39;, which may be present in a binary value.</p>
	**/
	function value():Void;
}