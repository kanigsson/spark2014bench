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

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
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

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__ada___ada___parent__child__grandchild__point_t__x natural)(rec__ada___ada___parent__child__grandchild__point_t__y natural)))))
(define-fun us_split_fields_rec__ada___ada___parent__child__grandchild__point_t__x__projection ((a us_split_fields)) natural 
  (rec__ada___ada___parent__child__grandchild__point_t__x a))

(define-fun us_split_fields_rec__ada___ada___parent__child__grandchild__point_t__y__projection ((a us_split_fields)) natural 
  (rec__ada___ada___parent__child__grandchild__point_t__y a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__ada___ada___parent__child__grandchild__point_t__x
                           (us_split_fields1 a))) (to_rep
                                                  (rec__ada___ada___parent__child__grandchild__point_t__x
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__ada___ada___parent__child__grandchild__point_t__y
                           (us_split_fields1 a))) (to_rep
                                                  (rec__ada___ada___parent__child__grandchild__point_t__y
                                                  (us_split_fields1 b)))))
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

(declare-const ada___ada___parent__child__grandchild__point_t__x__first__bit Int)

(declare-const ada___ada___parent__child__grandchild__point_t__x__last__bit Int)

(declare-const ada___ada___parent__child__grandchild__point_t__x__position Int)

;; ada___ada___parent__child__grandchild__point_t__x__first__bit_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__point_t__x__first__bit))

;; ada___ada___parent__child__grandchild__point_t__x__last__bit_axiom
  (assert
  (< ada___ada___parent__child__grandchild__point_t__x__first__bit ada___ada___parent__child__grandchild__point_t__x__last__bit))

;; ada___ada___parent__child__grandchild__point_t__x__position_axiom
  (assert (<= 0 ada___ada___parent__child__grandchild__point_t__x__position))

(declare-const ada___ada___parent__child__grandchild__point_t__y__first__bit Int)

(declare-const ada___ada___parent__child__grandchild__point_t__y__last__bit Int)

(declare-const ada___ada___parent__child__grandchild__point_t__y__position Int)

;; ada___ada___parent__child__grandchild__point_t__y__first__bit_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__point_t__y__first__bit))

;; ada___ada___parent__child__grandchild__point_t__y__last__bit_axiom
  (assert
  (< ada___ada___parent__child__grandchild__point_t__y__first__bit ada___ada___parent__child__grandchild__point_t__y__last__bit))

;; ada___ada___parent__child__grandchild__point_t__y__position_axiom
  (assert (<= 0 ada___ada___parent__child__grandchild__point_t__y__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((point_t__ref 0))
(((point_t__refqtmk (point_t__content us_rep)))))
(define-fun point_t__ref_point_t__content__projection ((a point_t__ref)) us_rep 
  (point_t__content a))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int us_rep))))))
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

(declare-const dummy2 (Array Int us_rep))

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

(declare-fun user_eq2 ((Array Int us_rep) (Array Int us_rep)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__ada___ada___parent__child__grandchild__exp_seq_t__len natural)(rec__ada___ada___parent__child__grandchild__exp_seq_t__points (Array Int us_rep))))))
(define-fun us_split_fields_rec__ada___ada___parent__child__grandchild__exp_seq_t__len__projection ((a us_split_fields2)) natural 
  (rec__ada___ada___parent__child__grandchild__exp_seq_t__len a))

(define-fun us_split_fields_rec__ada___ada___parent__child__grandchild__exp_seq_t__points__projection ((a us_split_fields2)) (Array Int us_rep) 
  (rec__ada___ada___parent__child__grandchild__exp_seq_t__points a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__ada___ada___parent__child__grandchild__exp_seq_t__len
                            (us_split_fields3 a))) (to_rep
                                                   (rec__ada___ada___parent__child__grandchild__exp_seq_t__len
                                                   (us_split_fields3 b))))
                         (= (bool_eq1
                            (rec__ada___ada___parent__child__grandchild__exp_seq_t__points
                            (us_split_fields3 a)) 1 100
                            (rec__ada___ada___parent__child__grandchild__exp_seq_t__points
                            (us_split_fields3 b)) 1 100) true))
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

(declare-const ada___ada___parent__child__grandchild__exp_seq_t__len__first__bit Int)

(declare-const ada___ada___parent__child__grandchild__exp_seq_t__len__last__bit Int)

(declare-const ada___ada___parent__child__grandchild__exp_seq_t__len__position Int)

;; ada___ada___parent__child__grandchild__exp_seq_t__len__first__bit_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__exp_seq_t__len__first__bit))

;; ada___ada___parent__child__grandchild__exp_seq_t__len__last__bit_axiom
  (assert
  (< ada___ada___parent__child__grandchild__exp_seq_t__len__first__bit 
  ada___ada___parent__child__grandchild__exp_seq_t__len__last__bit))

;; ada___ada___parent__child__grandchild__exp_seq_t__len__position_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__exp_seq_t__len__position))

(declare-const ada___ada___parent__child__grandchild__exp_seq_t__points__first__bit Int)

(declare-const ada___ada___parent__child__grandchild__exp_seq_t__points__last__bit Int)

(declare-const ada___ada___parent__child__grandchild__exp_seq_t__points__position Int)

;; ada___ada___parent__child__grandchild__exp_seq_t__points__first__bit_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__exp_seq_t__points__first__bit))

;; ada___ada___parent__child__grandchild__exp_seq_t__points__last__bit_axiom
  (assert
  (< ada___ada___parent__child__grandchild__exp_seq_t__points__first__bit 
  ada___ada___parent__child__grandchild__exp_seq_t__points__last__bit))

;; ada___ada___parent__child__grandchild__exp_seq_t__points__position_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__exp_seq_t__points__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ((exp_seq_t__ref 0))
(((exp_seq_t__refqtmk (exp_seq_t__content us_rep1)))))
(define-fun exp_seq_t__ref_exp_seq_t__content__projection ((a exp_seq_t__ref)) us_rep1 
  (exp_seq_t__content a))

(declare-const r us_rep1)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort idx_t 0)

(declare-fun idx_tqtint (idx_t) Int)

;; idx_t'axiom
  (assert
  (forall ((i1 idx_t)) (and (<= 1 (idx_tqtint i1)) (<= (idx_tqtint i1) 100))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 100)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq4 (idx_t idx_t) Bool)

(declare-const dummy4 idx_t)

(declare-datatypes ((idx_t__ref 0))
(((idx_t__refqtmk (idx_t__content idx_t)))))
(define-fun idx_t__ref_idx_t__content__projection ((a idx_t__ref)) idx_t 
  (idx_t__content a))

(define-fun to_rep1 ((x idx_t)) Int (idx_tqtint x))

(declare-fun of_rep1 (Int) idx_t)

;; inversion_axiom
  (assert
  (forall ((x idx_t))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x idx_t)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2
  (rec__ada___ada___parent__child__grandchild__opt_p_t__flag Bool)(rec__ada___ada___parent__child__grandchild__opt_p_t__idx idx_t)(rec__ada___ada___parent__child__grandchild__opt_p_t__the_p us_rep)))))
(define-fun us_split_fields_rec__ada___ada___parent__child__grandchild__opt_p_t__flag__projection ((a us_split_fields4)) Bool 
  (rec__ada___ada___parent__child__grandchild__opt_p_t__flag a))

(define-fun us_split_fields_rec__ada___ada___parent__child__grandchild__opt_p_t__idx__projection ((a us_split_fields4)) idx_t 
  (rec__ada___ada___parent__child__grandchild__opt_p_t__idx a))

(define-fun us_split_fields_rec__ada___ada___parent__child__grandchild__opt_p_t__the_p__projection ((a us_split_fields4)) us_rep 
  (rec__ada___ada___parent__child__grandchild__opt_p_t__the_p a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2 (us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun bool_eq3 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (and
                         (= (ite (rec__ada___ada___parent__child__grandchild__opt_p_t__flag
                                 (us_split_fields5 a)) 1 0) (ite (rec__ada___ada___parent__child__grandchild__opt_p_t__flag
                                                                 (us_split_fields5
                                                                 b)) 1 0))
                         (= (to_rep1
                            (rec__ada___ada___parent__child__grandchild__opt_p_t__idx
                            (us_split_fields5 a))) (to_rep1
                                                   (rec__ada___ada___parent__child__grandchild__opt_p_t__idx
                                                   (us_split_fields5 b)))))
                         (= (bool_eq
                            (rec__ada___ada___parent__child__grandchild__opt_p_t__the_p
                            (us_split_fields5 a))
                            (rec__ada___ada___parent__child__grandchild__opt_p_t__the_p
                            (us_split_fields5 b))) true))
                    true false))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const ada___ada___parent__child__grandchild__opt_p_t__flag__first__bit Int)

(declare-const ada___ada___parent__child__grandchild__opt_p_t__flag__last__bit Int)

(declare-const ada___ada___parent__child__grandchild__opt_p_t__flag__position Int)

;; ada___ada___parent__child__grandchild__opt_p_t__flag__first__bit_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__opt_p_t__flag__first__bit))

;; ada___ada___parent__child__grandchild__opt_p_t__flag__last__bit_axiom
  (assert
  (< ada___ada___parent__child__grandchild__opt_p_t__flag__first__bit 
  ada___ada___parent__child__grandchild__opt_p_t__flag__last__bit))

;; ada___ada___parent__child__grandchild__opt_p_t__flag__position_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__opt_p_t__flag__position))

(declare-const ada___ada___parent__child__grandchild__opt_p_t__idx__first__bit Int)

(declare-const ada___ada___parent__child__grandchild__opt_p_t__idx__last__bit Int)

(declare-const ada___ada___parent__child__grandchild__opt_p_t__idx__position Int)

;; ada___ada___parent__child__grandchild__opt_p_t__idx__first__bit_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__opt_p_t__idx__first__bit))

;; ada___ada___parent__child__grandchild__opt_p_t__idx__last__bit_axiom
  (assert
  (< ada___ada___parent__child__grandchild__opt_p_t__idx__first__bit 
  ada___ada___parent__child__grandchild__opt_p_t__idx__last__bit))

;; ada___ada___parent__child__grandchild__opt_p_t__idx__position_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__opt_p_t__idx__position))

(declare-const ada___ada___parent__child__grandchild__opt_p_t__the_p__first__bit Int)

(declare-const ada___ada___parent__child__grandchild__opt_p_t__the_p__last__bit Int)

(declare-const ada___ada___parent__child__grandchild__opt_p_t__the_p__position Int)

;; ada___ada___parent__child__grandchild__opt_p_t__the_p__first__bit_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__opt_p_t__the_p__first__bit))

;; ada___ada___parent__child__grandchild__opt_p_t__the_p__last__bit_axiom
  (assert
  (< ada___ada___parent__child__grandchild__opt_p_t__the_p__first__bit 
  ada___ada___parent__child__grandchild__opt_p_t__the_p__last__bit))

;; ada___ada___parent__child__grandchild__opt_p_t__the_p__position_axiom
  (assert
  (<= 0 ada___ada___parent__child__grandchild__opt_p_t__the_p__position))

(declare-fun user_eq5 (us_rep2 us_rep2) Bool)

(declare-const dummy5 us_rep2)

(declare-datatypes ((opt_p_t__ref 0))
(((opt_p_t__refqtmk (opt_p_t__content us_rep2)))))
(define-fun opt_p_t__ref_opt_p_t__content__projection ((a opt_p_t__ref)) us_rep2 
  (opt_p_t__content a))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun dynamic_invariant ((temp___expr_160 Int)
  (temp___is_init_156 Bool) (temp___skip_constant_157 Bool)
  (temp___do_toplevel_158 Bool)
  (temp___do_typ_inv_159 Bool)) Bool (=>
                                     (or (= temp___is_init_156 true)
                                     (<= 1 100)) (in_range2 temp___expr_160)))

(define-fun dynamic_invariant1 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(assert
;; defqtvc
 ;; File "parent-child-grandchild.adb", line 10, characters 0-0
  (not (=> (dynamic_invariant i true false true true) (in_range2 (+ i 1)))))
(check-sat)
(exit)
