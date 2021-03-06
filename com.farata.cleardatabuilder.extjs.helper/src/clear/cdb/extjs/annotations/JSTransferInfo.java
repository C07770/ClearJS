package clear.cdb.extjs.annotations;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.ANNOTATION_TYPE)
/* Write about FXOneToMany picked up automatically from @OneToMany*/
public @interface JSTransferInfo {
	String type(); 
	Class<?> mappedBy() default DEFAULT.class;
}
