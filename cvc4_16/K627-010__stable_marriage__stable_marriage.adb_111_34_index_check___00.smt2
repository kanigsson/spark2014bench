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

(declare-sort group1_id 0)

(declare-fun group1_idqtint (group1_id) Int)

;; group1_id'axiom
  (assert
  (forall ((i group1_id))
  (and (<= 1 (group1_idqtint i)) (<= (group1_idqtint i) 64))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 64)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (group1_id group1_id) Bool)

(declare-const dummy group1_id)

(declare-datatypes ((group1_id__ref 0))
(((group1_id__refqtmk (group1_id__content group1_id)))))
(define-fun group1_id__ref_group1_id__content__projection ((a group1_id__ref)) group1_id 
  (group1_id__content a))

(define-fun to_rep ((x group1_id)) Int (group1_idqtint x))

(declare-fun of_rep (Int) group1_id)

;; inversion_axiom
  (assert
  (forall ((x group1_id))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x group1_id)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int group1_id))))))
(declare-fun slide ((Array Int group1_id) Int Int) (Array Int group1_id))

;; slide_eq
  (assert
  (forall ((a (Array Int group1_id)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int group1_id)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int group1_id)) (a__first Int) (a__last Int)
  (b (Array Int group1_id)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int group1_id)) (b (Array Int group1_id)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep (select a temp___idx_154)) (to_rep
                                        (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const g2_to_g1 (Array Int group1_id))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-sort group2_id 0)

(declare-fun group2_idqtint (group2_id) Int)

;; group2_id'axiom
  (assert
  (forall ((i group2_id))
  (and (<= 1 (group2_idqtint i)) (<= (group2_idqtint i) 64))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 64)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (group2_id group2_id) Bool)

(declare-const dummy1 group2_id)

(declare-datatypes ((group2_id__ref 0))
(((group2_id__refqtmk (group2_id__content group2_id)))))
(define-fun group2_id__ref_group2_id__content__projection ((a group2_id__ref)) group2_id 
  (group2_id__content a))

(define-fun to_rep1 ((x group2_id)) Int (group2_idqtint x))

(declare-fun of_rep1 (Int) group2_id)

;; inversion_axiom
  (assert
  (forall ((x group2_id))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x group2_id)) (! (in_range2
  (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int group2_id))))))
(declare-fun slide1 ((Array Int group2_id) Int Int) (Array Int group2_id))

;; slide_eq
  (assert
  (forall ((a (Array Int group2_id)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int group2_id)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int group2_id)) (a__first Int) (a__last Int)
  (b (Array Int group2_id)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_155 Int))
                           (=>
                           (and (<= a__first temp___idx_155)
                           (<= temp___idx_155 a__last))
                           (= (to_rep1 (select a temp___idx_155)) (to_rep1
                                                                  (select b (+ (- b__first a__first) temp___idx_155)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int group2_id)) (b (Array Int group2_id)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_155 Int))
  (=> (and (<= a__first temp___idx_155) (<= temp___idx_155 a__last))
  (= (to_rep1 (select a temp___idx_155)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_155)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-fun stable_marriage__invert_map__result__aggregate_def (Int) (Array Int group2_id))

(define-fun dynamic_invariant ((temp___expr_184 Int)
  (temp___is_init_180 Bool) (temp___skip_constant_181 Bool)
  (temp___do_toplevel_182 Bool)
  (temp___do_typ_inv_183 Bool)) Bool (=>
                                     (or (= temp___is_init_180 true)
                                     (<= 1 64)) (in_range2 temp___expr_184)))

(declare-const rliteral group2_id)

;; rliteral_axiom
  (assert (= (group2_idqtint rliteral) 64))

;; def_axiom
  (assert
  (forall ((temp___580 Int))
  (=> (dynamic_invariant temp___580 true true true true)
  (forall ((temp___581 Int))
  (= (select (stable_marriage__invert_map__result__aggregate_def temp___580) temp___581) 
  rliteral)))))

(define-fun dynamic_invariant1 ((temp___expr_177 Int)
  (temp___is_init_173 Bool) (temp___skip_constant_174 Bool)
  (temp___do_toplevel_175 Bool)
  (temp___do_typ_inv_176 Bool)) Bool (=>
                                     (or (= temp___is_init_173 true)
                                     (<= 1 64)) (in_range1 temp___expr_177)))

(assert
;; defqtvc
 ;; File "stable_marriage.ads", line 67, characters 0-0
  (not
  (forall ((result__ (Array Int group2_id)))
  (=>
  (forall ((g1 Int))
  (=> (and (<= 1 g1) (<= g1 64))
  (exists ((g2 Int))
  (and (and (<= 1 g2) (<= g2 64)) (= (to_rep (select g2_to_g1 g2)) g1)))))
  (=> (= result__ (stable_marriage__invert_map__result__aggregate_def 64))
  (let ((o g2_to_g1))
  (=>
  (forall ((g21 Int))
  (=> (and (<= 1 g21) (<= g21 64))
  (forall ((g22 Int))
  (=> (and (<= 1 g22) (<= g22 64))
  (=> (not (= g21 g22))
  (not (= (to_rep (select o g21)) (to_rep (select o g22)))))))))
  (forall ((g2 Int))
  (=> (= g2 1)
  (=> (= (and (ite (<= 1 g2) true false) (ite (<= g2 64) true false)) true)
  (forall ((usf Int))
  (=>
  (= (and (ite (<= 1 usf) true false) (ite (<= usf (- g2 1)) true false)) true)
  (<= 1 usf)))))))))))))
(check-sat)
(exit)
