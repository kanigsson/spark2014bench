(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort component_type 0)

(declare-fun component_typeqtint (component_type) Int)

;; component_type'axiom
  (assert
  (forall ((i component_type))
  (and (<= 0 (component_typeqtint i))
  (<= (component_typeqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (component_type component_type) Bool)

(declare-const dummy1 component_type)

(declare-datatypes ((component_type__ref 0))
(((component_type__refqtmk (component_type__content component_type)))))
(define-fun component_type__ref_component_type__content__projection ((a component_type__ref)) component_type 
  (component_type__content a))

(declare-sort component_index_type 0)

(declare-fun component_index_typeqtint (component_index_type) Int)

;; component_index_type'axiom
  (assert
  (forall ((i component_index_type))
  (and (<= 1 (component_index_typeqtint i))
  (<= (component_index_typeqtint i) 15))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 15)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (component_index_type component_index_type) Bool)

(declare-const dummy2 component_index_type)

(declare-datatypes ((component_index_type__ref 0))
(((component_index_type__refqtmk
  (component_index_type__content component_index_type)))))
(define-fun component_index_type__ref_component_index_type__content__projection ((a component_index_type__ref)) component_index_type 
  (component_index_type__content a))

(define-fun to_rep1 ((x component_type)) Int (component_typeqtint x))

(declare-fun of_rep1 (Int) component_type)

;; inversion_axiom
  (assert
  (forall ((x component_type))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x component_type)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int component_type))))))
(declare-fun slide ((Array Int component_type) Int
  Int) (Array Int component_type))

;; slide_eq
  (assert
  (forall ((a (Array Int component_type)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int component_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int component_type)) (a__first Int)
  (a__last Int) (b (Array Int component_type)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int component_type)) (b (Array Int component_type)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range1 f)
     (=> (in_range1 l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range1 low)
                   (and (in_range1 high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int component_type))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int component_type) (elts a))

(define-fun of_array ((a (Array Int component_type)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const component__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(define-fun bool_eq1 ((x us_t)
  (y us_t)) Bool (bool_eq (elts x) (to_rep (first (rt x)))
                 (to_rep (last (rt x))) (elts y) (to_rep (first (rt y)))
                 (to_rep (last (rt y)))))

(declare-fun user_eq3 (us_t us_t) Bool)

(declare-const dummy3 us_t)

(declare-datatypes ((component_array__ref 0))
(((component_array__refqtmk (component_array__content us_t)))))
(define-fun component_array__ref_component_array__content__projection ((a component_array__ref)) us_t 
  (component_array__content a))

(declare-const separates us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort root_component_type 0)

(declare-fun root_component_typeqtint (root_component_type) Int)

;; root_component_type'axiom
  (assert
  (forall ((i root_component_type))
  (and (<= 0 (root_component_typeqtint i))
  (<= (root_component_typeqtint i) 2))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (root_component_type root_component_type) Bool)

(declare-const dummy4 root_component_type)

(declare-datatypes ((root_component_type__ref 0))
(((root_component_type__refqtmk
  (root_component_type__content root_component_type)))))
(define-fun root_component_type__ref_root_component_type__content__projection ((a root_component_type__ref)) root_component_type 
  (root_component_type__content a))

(define-fun to_rep2 ((x root_component_type)) Int (root_component_typeqtint
                                                  x))

(declare-fun of_rep2 (Int) root_component_type)

;; inversion_axiom
  (assert
  (forall ((x root_component_type))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x root_component_type)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort second_level_component_type 0)

(declare-fun second_level_component_typeqtint (second_level_component_type) Int)

;; second_level_component_type'axiom
  (assert
  (forall ((i second_level_component_type))
  (and (<= 0 (second_level_component_typeqtint i))
  (<= (second_level_component_typeqtint i) 175))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 175)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (second_level_component_type
  second_level_component_type) Bool)

(declare-const dummy5 second_level_component_type)

(declare-datatypes ((second_level_component_type__ref 0))
(((second_level_component_type__refqtmk
  (second_level_component_type__content second_level_component_type)))))
(define-fun second_level_component_type__ref_second_level_component_type__content__projection ((a second_level_component_type__ref)) second_level_component_type 
  (second_level_component_type__content a))

(define-fun to_rep3 ((x second_level_component_type)) Int (second_level_component_typeqtint
                                                          x))

(declare-fun of_rep3 (Int) second_level_component_type)

;; inversion_axiom
  (assert
  (forall ((x second_level_component_type))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x second_level_component_type)) (! (in_range5
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-const dummy6 (Array Int component_type))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq6 ((Array Int component_type)
  (Array Int component_type)) Bool)

(declare-sort other_count_type 0)

(declare-fun other_count_typeqtint (other_count_type) Int)

;; other_count_type'axiom
  (assert
  (forall ((i other_count_type))
  (and (<= 0 (other_count_typeqtint i)) (<= (other_count_typeqtint i) 13))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 13)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq7 (other_count_type other_count_type) Bool)

(declare-const dummy7 other_count_type)

(declare-datatypes ((other_count_type__ref 0))
(((other_count_type__refqtmk (other_count_type__content other_count_type)))))
(define-fun other_count_type__ref_other_count_type__content__projection ((a other_count_type__ref)) other_count_type 
  (other_count_type__content a))

(define-fun to_rep4 ((x other_count_type)) Int (other_count_typeqtint x))

(declare-fun of_rep4 (Int) other_count_type)

;; inversion_axiom
  (assert
  (forall ((x other_count_type))
  (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert
  (forall ((x other_count_type)) (! (in_range6
  (to_rep4 x)) :pattern ((to_rep4 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range6 x) (= (to_rep4 (of_rep4 x)) x)) :pattern ((to_rep4
                                                              (of_rep4 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__ada___hermes__oid__object_identifier__root_component root_component_type)(rec__ada___hermes__oid__object_identifier__second_level_component second_level_component_type)(rec__ada___hermes__oid__object_identifier__other_components (Array Int component_type))(rec__ada___hermes__oid__object_identifier__other_component_count other_count_type)))))
(define-fun us_split_fields_rec__ada___hermes__oid__object_identifier__root_component__projection ((a us_split_fields)) root_component_type 
  (rec__ada___hermes__oid__object_identifier__root_component a))

(define-fun us_split_fields_rec__ada___hermes__oid__object_identifier__second_level_component__projection ((a us_split_fields)) second_level_component_type 
  (rec__ada___hermes__oid__object_identifier__second_level_component a))

(define-fun us_split_fields_rec__ada___hermes__oid__object_identifier__other_components__projection ((a us_split_fields)) (Array Int component_type) 
  (rec__ada___hermes__oid__object_identifier__other_components a))

(define-fun us_split_fields_rec__ada___hermes__oid__object_identifier__other_component_count__projection ((a us_split_fields)) other_count_type 
  (rec__ada___hermes__oid__object_identifier__other_component_count a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq2 ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep2
                           (rec__ada___hermes__oid__object_identifier__root_component
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__ada___hermes__oid__object_identifier__root_component
                                                  (us_split_fields1 b))))
                        (= (to_rep3
                           (rec__ada___hermes__oid__object_identifier__second_level_component
                           (us_split_fields1 a))) (to_rep3
                                                  (rec__ada___hermes__oid__object_identifier__second_level_component
                                                  (us_split_fields1 b)))))
                        (and
                        (= (bool_eq
                           (rec__ada___hermes__oid__object_identifier__other_components
                           (us_split_fields1 a)) 1 13
                           (rec__ada___hermes__oid__object_identifier__other_components
                           (us_split_fields1 b)) 1 13) true)
                        (= (to_rep4
                           (rec__ada___hermes__oid__object_identifier__other_component_count
                           (us_split_fields1 a))) (to_rep4
                                                  (rec__ada___hermes__oid__object_identifier__other_component_count
                                                  (us_split_fields1 b))))))
                   true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const ada___hermes__oid__object_identifier__root_component__first__bit Int)

(declare-const ada___hermes__oid__object_identifier__root_component__last__bit Int)

(declare-const ada___hermes__oid__object_identifier__root_component__position Int)

;; ada___hermes__oid__object_identifier__root_component__first__bit_axiom
  (assert
  (<= 0 ada___hermes__oid__object_identifier__root_component__first__bit))

;; ada___hermes__oid__object_identifier__root_component__last__bit_axiom
  (assert
  (< ada___hermes__oid__object_identifier__root_component__first__bit 
  ada___hermes__oid__object_identifier__root_component__last__bit))

;; ada___hermes__oid__object_identifier__root_component__position_axiom
  (assert
  (<= 0 ada___hermes__oid__object_identifier__root_component__position))

(declare-const ada___hermes__oid__object_identifier__second_level_component__first__bit Int)

(declare-const ada___hermes__oid__object_identifier__second_level_component__last__bit Int)

(declare-const ada___hermes__oid__object_identifier__second_level_component__position Int)

;; ada___hermes__oid__object_identifier__second_level_component__first__bit_axiom
  (assert
  (<= 0 ada___hermes__oid__object_identifier__second_level_component__first__bit))

;; ada___hermes__oid__object_identifier__second_level_component__last__bit_axiom
  (assert
  (< ada___hermes__oid__object_identifier__second_level_component__first__bit 
  ada___hermes__oid__object_identifier__second_level_component__last__bit))

;; ada___hermes__oid__object_identifier__second_level_component__position_axiom
  (assert
  (<= 0 ada___hermes__oid__object_identifier__second_level_component__position))

(declare-const ada___hermes__oid__object_identifier__other_components__first__bit Int)

(declare-const ada___hermes__oid__object_identifier__other_components__last__bit Int)

(declare-const ada___hermes__oid__object_identifier__other_components__position Int)

;; ada___hermes__oid__object_identifier__other_components__first__bit_axiom
  (assert
  (<= 0 ada___hermes__oid__object_identifier__other_components__first__bit))

;; ada___hermes__oid__object_identifier__other_components__last__bit_axiom
  (assert
  (< ada___hermes__oid__object_identifier__other_components__first__bit 
  ada___hermes__oid__object_identifier__other_components__last__bit))

;; ada___hermes__oid__object_identifier__other_components__position_axiom
  (assert
  (<= 0 ada___hermes__oid__object_identifier__other_components__position))

(declare-const ada___hermes__oid__object_identifier__other_component_count__first__bit Int)

(declare-const ada___hermes__oid__object_identifier__other_component_count__last__bit Int)

(declare-const ada___hermes__oid__object_identifier__other_component_count__position Int)

;; ada___hermes__oid__object_identifier__other_component_count__first__bit_axiom
  (assert
  (<= 0 ada___hermes__oid__object_identifier__other_component_count__first__bit))

;; ada___hermes__oid__object_identifier__other_component_count__last__bit_axiom
  (assert
  (< ada___hermes__oid__object_identifier__other_component_count__first__bit 
  ada___hermes__oid__object_identifier__other_component_count__last__bit))

;; ada___hermes__oid__object_identifier__other_component_count__position_axiom
  (assert
  (<= 0 ada___hermes__oid__object_identifier__other_component_count__position))

(declare-fun user_eq8 (us_rep us_rep) Bool)

(declare-const dummy8 us_rep)

(declare-datatypes ((object_identifier__ref 0))
(((object_identifier__refqtmk (object_identifier__content us_rep)))))
(define-fun object_identifier__ref_object_identifier__content__projection ((a object_identifier__ref)) us_rep 
  (object_identifier__content a))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun bad_first_level (Int) Bool)

(declare-fun bad_first_level__function_guard (Bool Int) Bool)

(define-fun dynamic_invariant ((temp___expr_163 Int)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (or (= temp___is_init_159 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_163)))

;; bad_first_level__post_axiom
  (assert true)

;; bad_first_level__def_axiom
  (assert
  (forall ((root Int))
  (! (= (= (bad_first_level root) true)
     (not (or (or (= root 0) (= root 1)) (= root 2)))) :pattern ((bad_first_level
                                                                 root)) )))

(declare-fun bad_second_level (Int Int) Bool)

(declare-fun bad_second_level__function_guard (Bool Int Int) Bool)

;; bad_second_level__post_axiom
  (assert true)

;; bad_second_level__def_axiom
  (assert
  (forall ((root Int) (second Int))
  (! (= (= (bad_second_level root second) true)
     (not
     (ite (= root 0) (< second 40)
     (ite (= root 1) (< second 40) (and (= root 2) (<= second 175)))))) :pattern (
  (bad_second_level root second)) )))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(define-fun dynamic_invariant1 ((temp___expr_184 us_t)
  (temp___is_init_180 Bool) (temp___skip_constant_181 Bool)
  (temp___do_toplevel_182 Bool)
  (temp___do_typ_inv_183 Bool)) Bool (=>
                                     (not (= temp___skip_constant_181 true))
                                     (dynamic_property 1 15
                                     (first1 temp___expr_184)
                                     (last1 temp___expr_184))))

(declare-sort status_type 0)

(define-fun in_range7 ((x Int)) Bool (and (<= 0 x) (<= x 3)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (status_type status_type) Bool)

(declare-const dummy9 status_type)

(declare-datatypes ((status_type__ref 0))
(((status_type__refqtmk (status_type__content status_type)))))
(define-fun status_type__ref_status_type__content__projection ((a status_type__ref)) status_type 
  (status_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_190 Int)
  (temp___is_init_186 Bool) (temp___skip_constant_187 Bool)
  (temp___do_toplevel_188 Bool)
  (temp___do_typ_inv_189 Bool)) Bool (=>
                                     (or (= temp___is_init_186 true)
                                     (<= 0 3)) (in_range7 temp___expr_190)))

(declare-sort other_index_type 0)

(declare-fun other_index_typeqtint (other_index_type) Int)

;; other_index_type'axiom
  (assert
  (forall ((i other_index_type))
  (and (<= 1 (other_index_typeqtint i)) (<= (other_index_typeqtint i) 13))))

(define-fun in_range8 ((x Int)) Bool (and (<= 1 x) (<= x 13)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq10 (other_index_type other_index_type) Bool)

(declare-const dummy10 other_index_type)

(declare-datatypes ((other_index_type__ref 0))
(((other_index_type__refqtmk (other_index_type__content other_index_type)))))
(define-fun other_index_type__ref_other_index_type__content__projection ((a other_index_type__ref)) other_index_type 
  (other_index_type__content a))

(declare-fun temp_____aggregate_def_300 (Int) (Array Int component_type))

(define-fun dynamic_invariant3 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const rliteral component_type)

;; rliteral_axiom
  (assert (= (component_typeqtint rliteral) 0))

;; def_axiom
  (assert
  (forall ((temp___302 Int))
  (=> (dynamic_invariant temp___302 true true true true)
  (forall ((temp___303 Int))
  (= (select (temp_____aggregate_def_300 temp___302) temp___303) rliteral)))))

(define-fun dynamic_invariant4 ((temp___expr_177 Int)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (<= 1 15)) (in_range3 temp___expr_177)))

(define-fun dynamic_invariant5 ((temp___expr_197 Int)
  (temp___is_init_193 Bool) (temp___skip_constant_194 Bool)
  (temp___do_toplevel_195 Bool)
  (temp___do_typ_inv_196 Bool)) Bool (=>
                                     (or (= temp___is_init_193 true)
                                     (<= 0 2)) (in_range4 temp___expr_197)))

(define-fun dynamic_invariant6 ((temp___expr_204 Int)
  (temp___is_init_200 Bool) (temp___skip_constant_201 Bool)
  (temp___do_toplevel_202 Bool)
  (temp___do_typ_inv_203 Bool)) Bool (=>
                                     (or (= temp___is_init_200 true)
                                     (<= 0 175)) (in_range5 temp___expr_204)))

(define-fun dynamic_invariant7 ((temp___expr_211 Int)
  (temp___is_init_207 Bool) (temp___skip_constant_208 Bool)
  (temp___do_toplevel_209 Bool)
  (temp___do_typ_inv_210 Bool)) Bool (=>
                                     (or (= temp___is_init_207 true)
                                     (<= 1 13)) (in_range8 temp___expr_211)))

(define-fun dynamic_invariant8 ((temp___expr_228 Int)
  (temp___is_init_224 Bool) (temp___skip_constant_225 Bool)
  (temp___do_toplevel_226 Bool)
  (temp___do_typ_inv_227 Bool)) Bool (=>
                                     (or (= temp___is_init_224 true)
                                     (<= 0 13)) (in_range6 temp___expr_228)))

(assert
;; defqtvc
 ;; File "hermes-oid.ads", line 25, characters 0-0
  (not
  (forall ((status Int))
  (=> (dynamic_invariant1 separates true false true true)
  (=> (dynamic_invariant2 status false false true true)
  (=> (not (< (length separates) 1))
  (<= (first1 separates) (first1 separates))))))))
(check-sat)
(exit)
