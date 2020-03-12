(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const x Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep1 ((x1 integer)) Int (integerqtint x1))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x1 integer))
  (! (= (of_rep1 (to_rep1 x1)) x1) :pattern ((to_rep1 x1)) )))

;; range_axiom
  (assert
  (forall ((x1 integer)) (! (in_range
  (to_rep1 x1)) :pattern ((to_rep1 x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range x1) (= (to_rep1 (of_rep1 x1)) x1)) :pattern ((to_rep1
                                                                (of_rep1 x1))) )))

(declare-sort item_type 0)

(declare-fun item_typeqtint (item_type) Int)

;; item_type'axiom
  (assert
  (forall ((i item_type))
  (and (<= 1 (item_typeqtint i)) (<= (item_typeqtint i) 100))))

(define-fun in_range3 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 100)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (item_type item_type) Bool)

(declare-const dummy3 item_type)

(declare-datatypes ()
((item_type__ref (item_type__refqtmk (item_type__content item_type)))))
(define-fun item_type__ref_item_type__content__projection ((a item_type__ref)) item_type 
  (item_type__content a))

(define-fun to_rep2 ((x1 item_type)) Int (item_typeqtint x1))

(declare-fun of_rep2 (Int) item_type)

;; inversion_axiom
  (assert
  (forall ((x1 item_type))
  (! (= (of_rep2 (to_rep2 x1)) x1) :pattern ((to_rep2 x1)) )))

;; range_axiom
  (assert
  (forall ((x1 item_type)) (! (in_range3
  (to_rep2 x1)) :pattern ((to_rep2 x1)) )))

;; coerce_axiom
  (assert
  (forall ((x1 Int))
  (! (=> (in_range3 x1) (= (to_rep2 (of_rep2 x1)) x1)) :pattern ((to_rep2
                                                                 (of_rep2 x1))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int item_type))))))
(declare-fun slide ((Array Int item_type) Int Int) (Array Int item_type))

;; slide_eq
  (assert
  (forall ((a (Array Int item_type)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int item_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int item_type)) (a__first Int) (a__last Int)
  (b (Array Int item_type)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep2 (select a temp___idx_154)) (to_rep2
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int item_type)) (b (Array Int item_type)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep2 (select a temp___idx_154)) (to_rep2
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep1 (first (mk f l))) f) (= (to_rep1 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int item_type))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int item_type) (elts a))

(define-fun of_array ((a (Array Int item_type)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep1 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep1 (last (rt a))))

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

(define-fun bool_eq1 ((x1 us_t)
  (y us_t)) Bool (bool_eq (elts x1) (to_rep1 (first (rt x1)))
                 (to_rep1 (last (rt x1))) (elts y) (to_rep1 (first (rt y)))
                 (to_rep1 (last (rt y)))))

(declare-fun user_eq4 (us_t us_t) Bool)

(declare-const dummy4 us_t)

(declare-datatypes ()
((item_array__ref (item_array__refqtmk (item_array__content us_t)))))
(define-fun item_array__ref_item_array__content__projection ((a item_array__ref)) us_t 
  (item_array__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__c910003_pack__buffer__saved_item item_type)(rec__c910003_pack__buffer__empty Bool)(rec__c910003_pack__buffer__tc_items (Array Int item_type))(rec__c910003_pack__buffer__tc_last natural)))))
(define-fun us_split_fields_rec__c910003_pack__buffer__saved_item__projection ((a us_split_fields)) item_type 
  (rec__c910003_pack__buffer__saved_item a))

(define-fun us_split_fields_rec__c910003_pack__buffer__empty__projection ((a us_split_fields)) Bool 
  (rec__c910003_pack__buffer__empty a))

(define-fun us_split_fields_rec__c910003_pack__buffer__tc_items__projection ((a us_split_fields)) (Array Int item_type) 
  (rec__c910003_pack__buffer__tc_items a))

(define-fun us_split_fields_rec__c910003_pack__buffer__tc_last__projection ((a us_split_fields)) natural 
  (rec__c910003_pack__buffer__tc_last a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const c910003_pack__buffer__saved_item__first__bit Int)

(declare-const c910003_pack__buffer__saved_item__last__bit Int)

(declare-const c910003_pack__buffer__saved_item__position Int)

;; c910003_pack__buffer__saved_item__first__bit_axiom
  (assert (<= 0 c910003_pack__buffer__saved_item__first__bit))

;; c910003_pack__buffer__saved_item__last__bit_axiom
  (assert
  (< c910003_pack__buffer__saved_item__first__bit c910003_pack__buffer__saved_item__last__bit))

;; c910003_pack__buffer__saved_item__position_axiom
  (assert (<= 0 c910003_pack__buffer__saved_item__position))

(declare-const c910003_pack__buffer__empty__first__bit Int)

(declare-const c910003_pack__buffer__empty__last__bit Int)

(declare-const c910003_pack__buffer__empty__position Int)

;; c910003_pack__buffer__empty__first__bit_axiom
  (assert (<= 0 c910003_pack__buffer__empty__first__bit))

;; c910003_pack__buffer__empty__last__bit_axiom
  (assert
  (< c910003_pack__buffer__empty__first__bit c910003_pack__buffer__empty__last__bit))

;; c910003_pack__buffer__empty__position_axiom
  (assert (<= 0 c910003_pack__buffer__empty__position))

(declare-const c910003_pack__buffer__tc_items__first__bit Int)

(declare-const c910003_pack__buffer__tc_items__last__bit Int)

(declare-const c910003_pack__buffer__tc_items__position Int)

;; c910003_pack__buffer__tc_items__first__bit_axiom
  (assert (<= 0 c910003_pack__buffer__tc_items__first__bit))

;; c910003_pack__buffer__tc_items__last__bit_axiom
  (assert
  (< c910003_pack__buffer__tc_items__first__bit c910003_pack__buffer__tc_items__last__bit))

;; c910003_pack__buffer__tc_items__position_axiom
  (assert (<= 0 c910003_pack__buffer__tc_items__position))

(declare-const c910003_pack__buffer__tc_last__first__bit Int)

(declare-const c910003_pack__buffer__tc_last__last__bit Int)

(declare-const c910003_pack__buffer__tc_last__position Int)

;; c910003_pack__buffer__tc_last__first__bit_axiom
  (assert (<= 0 c910003_pack__buffer__tc_last__first__bit))

;; c910003_pack__buffer__tc_last__last__bit_axiom
  (assert
  (< c910003_pack__buffer__tc_last__first__bit c910003_pack__buffer__tc_last__last__bit))

;; c910003_pack__buffer__tc_last__position_axiom
  (assert (<= 0 c910003_pack__buffer__tc_last__position))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-datatypes ()
((buffer__ref (buffer__refqtmk (buffer__content us_rep)))))
(define-fun buffer__ref_buffer__content__projection ((a buffer__ref)) us_rep 
  (buffer__content a))

(define-fun in_range4 ((x1 Int)) Bool (or (= x1 0) (= x1 1)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Bool)

(declare-fun temp_____aggregate_def_203 (Int) (Array Int item_type))

(define-fun default_initial_assumption ((temp___expr_201 us_rep)
  (temp___skip_top_level_202 Bool)) Bool (and
                                         (and
                                         (= (to_rep2
                                            (rec__c910003_pack__buffer__saved_item
                                            (us_split_fields1
                                            temp___expr_201))) 1)
                                         (= (rec__c910003_pack__buffer__empty
                                            (us_split_fields1
                                            temp___expr_201)) (distinct 1 0)))
                                         (and
                                         (= (rec__c910003_pack__buffer__tc_items
                                            (us_split_fields1
                                            temp___expr_201)) (temp_____aggregate_def_203
                                                              1))
                                         (= (to_rep
                                            (rec__c910003_pack__buffer__tc_last
                                            (us_split_fields1
                                            temp___expr_201))) 0))))

(declare-sort t3s 0)

(declare-fun t3sqtint (t3s) Int)

;; t3s'axiom
  (assert (forall ((i t3s)) (and (<= 1 (t3sqtint i)) (<= (t3sqtint i) 10))))

(define-fun in_range5 ((x1 Int)) Bool (and (<= 1 x1) (<= x1 10)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq6 (t3s t3s) Bool)

(declare-const dummy5 t3s)

(declare-datatypes () ((t3s__ref (t3s__refqtmk (t3s__content t3s)))))
(define-fun t3s__ref_t3s__content__projection ((a t3s__ref)) t3s (t3s__content
                                                                 a))

(declare-datatypes () ((t10b__ref (t10b__refqtmk (t10b__content us_t)))))
(define-fun t10b__ref_t10b__content__projection ((a t10b__ref)) us_t 
  (t10b__content a))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 1 100)) (in_range3 temp___expr_165)))

(define-fun dynamic_invariant4 ((temp___expr_172 us_t)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (not (= temp___skip_constant_169 true))
                                     (dynamic_property 1 2147483647
                                     (first1 temp___expr_172)
                                     (last1 temp___expr_172))))

(declare-const rliteral item_type)

;; rliteral_axiom
  (assert (= (item_typeqtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___205 Int))
  (=> (dynamic_invariant3 temp___205 true true true true)
  (forall ((temp___206 Int))
  (= (select (temp_____aggregate_def_203 temp___205) temp___206) rliteral)))))

(declare-const self__ us_split_fields)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant x true false true true))

(declare-const temp___233 Int)

;; Ensures
  (assert
  (= (to_rep (rec__c910003_pack__buffer__tc_last self__)) temp___233))

;; H
  (assert (<= 1 temp___233))

(assert
;; defqtvc
 ;; File "c910003_pack.ads", line 9, characters 0-0
  (not (<= 1 1)))
(check-sat)
