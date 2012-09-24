package de.akquinet.jbosscc.guttenbase.projects.still;

import de.akquinet.jbosscc.guttenbase.hints.ColumnDataMapperProviderHint;
import de.akquinet.jbosscc.guttenbase.hints.impl.DefaultColumnDataMapperProvider;
import de.akquinet.jbosscc.guttenbase.mapping.ColumnDataMapperProvider;

public class StillColumnDataMapperHint extends ColumnDataMapperProviderHint {

	@Override
	public ColumnDataMapperProvider getValue() {
		return new DefaultColumnDataMapperProvider() {
			
		};
	}
}
