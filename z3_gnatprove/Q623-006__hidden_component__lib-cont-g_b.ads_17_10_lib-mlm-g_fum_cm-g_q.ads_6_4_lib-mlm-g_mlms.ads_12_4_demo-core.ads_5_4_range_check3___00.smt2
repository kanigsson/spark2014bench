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

(declare-sort t_c 0)

(declare-fun t_cqtint (t_c) Int)

;; t_c'axiom
  (assert
  (forall ((i t_c)) (and (<= 1 (t_cqtint i)) (<= (t_cqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (t_c t_c) Bool)

(declare-const dummy t_c)

(declare-datatypes () ((t_c__ref (t_c__refqtmk (t_c__content t_c)))))
(define-fun t_c__ref_t_c__content__projection ((a t_c__ref)) t_c (t_c__content
                                                                 a))

(define-fun dynamic_invariant ((temp___expr_232 Int)
  (temp___is_init_228 Bool) (temp___skip_constant_229 Bool)
  (temp___do_toplevel_230 Bool)
  (temp___do_typ_inv_231 Bool)) Bool (=>
                                     (or (= temp___is_init_228 true)
                                     (<= 1 2147483647)) (in_range
                                     temp___expr_232)))

(define-fun to_rep ((x t_c)) Int (t_cqtint x))

(declare-fun of_rep (Int) t_c)

;; inversion_axiom
  (assert
  (forall ((x t_c)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x t_c)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-sort index 0)

(declare-fun indexqtint (index) Int)

;; index'axiom
  (assert
  (forall ((i index))
  (and (<= 1 (indexqtint i)) (<= (indexqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (index index) Bool)

(declare-const dummy1 index)

(declare-datatypes () ((index__ref (index__refqtmk (index__content index)))))
(define-fun index__ref_index__content__projection ((a index__ref)) index 
  (index__content a))

(declare-sort t_command_id 0)

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (t_command_id t_command_id) Bool)

(declare-const dummy2 t_command_id)

(declare-datatypes ()
((t_command_id__ref
 (t_command_id__refqtmk (t_command_id__content t_command_id)))))
(define-fun t_command_id__ref_t_command_id__content__2__projection ((a t_command_id__ref)) t_command_id 
  (t_command_id__content a))

(declare-fun to_rep1 (t_command_id) Int)

(declare-fun of_rep1 (Int) t_command_id)

;; inversion_axiom
  (assert
  (forall ((x t_command_id))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x t_command_id)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__ada___demo__core__p_mlms__cm__internal__t_m__id t_command_id)))))
(define-fun us_split_fields_rec__ada___demo__core__p_mlms__cm__internal__t_m__id__projection ((a us_split_fields)) t_command_id 
  (rec__ada___demo__core__p_mlms__cm__internal__t_m__id a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep1
                           (rec__ada___demo__core__p_mlms__cm__internal__t_m__id
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__ada___demo__core__p_mlms__cm__internal__t_m__id
                                                  (us_split_fields1 b))))
                   true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const ada___demo__core__p_mlms__cm__internal__t_m__id__first__bit Int)

(declare-const ada___demo__core__p_mlms__cm__internal__t_m__id__last__bit Int)

(declare-const ada___demo__core__p_mlms__cm__internal__t_m__id__position Int)

;; ada___demo__core__p_mlms__cm__internal__t_m__id__first__bit_axiom
  (assert (<= 0 ada___demo__core__p_mlms__cm__internal__t_m__id__first__bit))

;; ada___demo__core__p_mlms__cm__internal__t_m__id__last__bit_axiom
  (assert
  (< ada___demo__core__p_mlms__cm__internal__t_m__id__first__bit ada___demo__core__p_mlms__cm__internal__t_m__id__last__bit))

;; ada___demo__core__p_mlms__cm__internal__t_m__id__position_axiom
  (assert (<= 0 ada___demo__core__p_mlms__cm__internal__t_m__id__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes () ((t_m__ref (t_m__refqtmk (t_m__content us_rep)))))
(define-fun t_m__ref_t_m__content__projection ((a t_m__ref)) us_rep (t_m__content
                                                                    a))

(declare-datatypes () ((t_e__ref (t_e__refqtmk (t_e__content us_rep)))))
(define-fun t_e__ref_t_e__content__projection ((a t_e__ref)) us_rep (t_e__content
                                                                    a))

(declare-sort tt_countB 0)

(declare-fun tt_countBqtint (tt_countB) Int)

;; tt_countB'axiom
  (assert
  (forall ((i tt_countB))
  (and (<= (- 2147483648) (tt_countBqtint i))
  (<= (tt_countBqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (tt_countB tt_countB) Bool)

(declare-const dummy4 tt_countB)

(declare-datatypes ()
((tt_countB__ref (tt_countB__refqtmk (tt_countB__content tt_countB)))))
(define-fun tt_countB__ref_tt_countB__content__projection ((a tt_countB__ref)) tt_countB 
  (tt_countB__content a))

(define-fun to_rep2 ((x tt_countB)) Int (tt_countBqtint x))

(declare-fun of_rep2 (Int) tt_countB)

;; inversion_axiom
  (assert
  (forall ((x tt_countB))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x tt_countB)) (! (in_range3
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int us_rep))))))
(declare-fun slide ((Array Int us_rep) Int Int) (Array Int us_rep))

;; slide_eq
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int us_rep)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int us_rep)) (a__first Int) (a__last Int)
  (b (Array Int us_rep)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (bool_eq (select a temp___idx_154)
                              (select b (+ (- b__first a__first) temp___idx_154))) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int us_rep)) (b (Array Int us_rep)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (bool_eq (select a temp___idx_154)
     (select b (+ (- b__first a__first) temp___idx_154))) true))))))))

(declare-sort t 0)

(declare-fun first (t) tt_countB)

(declare-fun last (t) tt_countB)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range3 f)
     (=> (in_range3 l)
     (and (= (to_rep2 (first (mk f l))) f) (= (to_rep2 (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range3 low)
                   (and (in_range3 high)
                   (=> (<= low high) (and (in_range1 low) (in_range1 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int us_rep))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int us_rep) (elts a))

(define-fun of_array ((a (Array Int us_rep)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep2 (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep2 (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
                                  (+ (- (last1 a) (first1 a)) 1) 0))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(define-fun bool_eq2 ((x us_t)
  (y us_t)) Bool (bool_eq1 (elts x) (to_rep2 (first (rt x)))
                 (to_rep2 (last (rt x))) (elts y) (to_rep2 (first (rt y)))
                 (to_rep2 (last (rt y)))))

(declare-fun user_eq5 (us_t us_t) Bool)

(declare-const dummy5 us_t)

(declare-datatypes () ((t_t__ref (t_t__refqtmk (t_t__content us_t)))))
(define-fun t_t__ref_t_t__content__projection ((a t_t__ref)) us_t (t_t__content
                                                                  a))

(declare-datatypes () ((t4s__ref (t4s__refqtmk (t4s__content us_t)))))
(define-fun t4s__ref_t4s__content__projection ((a t4s__ref)) us_t (t4s__content
                                                                  a))

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__ada___demo__core__p_mlms__all_f__q__t__c t_c)))))
(define-fun us_split_discrs_rec__ada___demo__core__p_mlms__all_f__q__t__c__projection ((a us_split_discrs)) t_c 
  (rec__ada___demo__core__p_mlms__all_f__q__t__c a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__ada___demo__core__p_mlms__all_f__q__t__e us_t)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__ada___demo__core__p_mlms__all_f__q__t__e__projection ((a us_split_fields2)) us_t 
  (rec__ada___demo__core__p_mlms__all_f__q__t__e a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields2)) us_private 
  (rec__ext__ a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs1 us_split_discrs)(us_split_fields3 us_split_fields2)(attr__tag Int)))))
(define-fun us_rep___split_discrs__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__projection ((a us_rep1)) Int (attr__tag a))

(define-fun bool_eq3 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__ada___demo__core__p_mlms__all_f__q__t__c
                            (us_split_discrs1 a))) (to_rep
                                                   (rec__ada___demo__core__p_mlms__all_f__q__t__c
                                                   (us_split_discrs1 b))))
                         (= (bool_eq2
                            (rec__ada___demo__core__p_mlms__all_f__q__t__e
                            (us_split_fields3 a))
                            (rec__ada___demo__core__p_mlms__all_f__q__t__e
                            (us_split_fields3 b))) true))
                    true false))

(declare-fun us_dispatch_eq (us_rep1 us_rep1) Bool)

(declare-const us_tag Int)

(define-fun in_range4 ((rec__ada___demo__core__p_mlms__all_f__q__t__c1 Int)
  (a us_split_discrs)) Bool (= rec__ada___demo__core__p_mlms__all_f__q__t__c1 
  (to_rep (rec__ada___demo__core__p_mlms__all_f__q__t__c a))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const ada___demo__core__p_mlms__all_f__q__t__c__first__bit Int)

(declare-const ada___demo__core__p_mlms__all_f__q__t__c__last__bit Int)

(declare-const ada___demo__core__p_mlms__all_f__q__t__c__position Int)

;; ada___demo__core__p_mlms__all_f__q__t__c__first__bit_axiom
  (assert (<= 0 ada___demo__core__p_mlms__all_f__q__t__c__first__bit))

;; ada___demo__core__p_mlms__all_f__q__t__c__last__bit_axiom
  (assert
  (< ada___demo__core__p_mlms__all_f__q__t__c__first__bit ada___demo__core__p_mlms__all_f__q__t__c__last__bit))

;; ada___demo__core__p_mlms__all_f__q__t__c__position_axiom
  (assert (<= 0 ada___demo__core__p_mlms__all_f__q__t__c__position))

(declare-const ada___demo__core__p_mlms__all_f__q__t__e__first__bit Int)

(declare-const ada___demo__core__p_mlms__all_f__q__t__e__last__bit Int)

(declare-const ada___demo__core__p_mlms__all_f__q__t__e__position Int)

;; ada___demo__core__p_mlms__all_f__q__t__e__first__bit_axiom
  (assert (<= 0 ada___demo__core__p_mlms__all_f__q__t__e__first__bit))

;; ada___demo__core__p_mlms__all_f__q__t__e__last__bit_axiom
  (assert
  (< ada___demo__core__p_mlms__all_f__q__t__e__first__bit ada___demo__core__p_mlms__all_f__q__t__e__last__bit))

;; ada___demo__core__p_mlms__all_f__q__t__e__position_axiom
  (assert (<= 0 ada___demo__core__p_mlms__all_f__q__t__e__position))

(declare-fun user_eq6 (us_rep1 us_rep1) Bool)

(declare-const dummy6 us_rep1)

(declare-datatypes () ((t__ref (t__refqtmk (t__content us_rep1)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep1 (t__content a))

(define-fun dynamic_invariant1 ((temp___expr_239 Int)
  (temp___is_init_235 Bool) (temp___skip_constant_236 Bool)
  (temp___do_toplevel_237 Bool)
  (temp___do_typ_inv_238 Bool)) Bool (=>
                                     (or (= temp___is_init_235 true)
                                     (<= 1 2147483647)) (in_range1
                                     temp___expr_239)))

(define-fun dynamic_invariant2 ((temp___expr_252 us_rep1)
  (temp___is_init_248 Bool) (temp___skip_constant_249 Bool)
  (temp___do_toplevel_250 Bool)
  (temp___do_typ_inv_251 Bool)) Bool (let ((temp___253 (rec__ada___demo__core__p_mlms__all_f__q__t__c
                                                       (us_split_discrs1
                                                       temp___expr_252))))
                                     (and (dynamic_property 1
                                     (to_rep temp___253)
                                     (first1
                                     (rec__ada___demo__core__p_mlms__all_f__q__t__e
                                     (us_split_fields3 temp___expr_252)))
                                     (last1
                                     (rec__ada___demo__core__p_mlms__all_f__q__t__e
                                     (us_split_fields3 temp___expr_252))))
                                     (and
                                     (= (first1
                                        (rec__ada___demo__core__p_mlms__all_f__q__t__e
                                        (us_split_fields3 temp___expr_252))) 1)
                                     (= (last1
                                        (rec__ada___demo__core__p_mlms__all_f__q__t__e
                                        (us_split_fields3 temp___expr_252))) 
                                     (to_rep temp___253))))))

(declare-const usf Int)

;; Ensures
  (assert (dynamic_invariant usf true true true true))

(declare-const usf1 us_rep1)

;; Ensures
  (assert
  (= (to_rep
     (rec__ada___demo__core__p_mlms__all_f__q__t__c (us_split_discrs1 usf1))) 
  usf))

;; H
  (assert (<= 1 usf))

(assert
;; defqtvc
 ;; File "lib-mlm-g_fum_cm-g_q.ads", line 6, characters 0-0
  (not (<= 1 1)))
(check-sat)
