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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

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

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__test_constrained__r__b Bool)))))
(define-fun us_split_discrs_rec__test_constrained__r__b__projection ((a us_split_discrs)) Bool 
  (rec__test_constrained__r__b a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__test_constrained__r__x integer)))))
(define-fun us_split_fields_rec__test_constrained__r__x__projection ((a us_split_fields)) integer 
  (rec__test_constrained__r__x a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (ite (rec__test_constrained__r__b
                                (us_split_discrs1 a)) 1 0) (ite (rec__test_constrained__r__b
                                                                (us_split_discrs1
                                                                b)) 1 0))
                        (= (to_rep
                           (rec__test_constrained__r__x (us_split_fields1 a))) 
                        (to_rep
                        (rec__test_constrained__r__x (us_split_fields1 b)))))
                   true false))

(define-fun in_range2 ((rec__test_constrained__r__b1 Bool)
  (a us_split_discrs)) Bool (= rec__test_constrained__r__b1 (rec__test_constrained__r__b
                                                            a)))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const test_constrained__r__b__first__bit Int)

(declare-const test_constrained__r__b__last__bit Int)

(declare-const test_constrained__r__b__position Int)

;; test_constrained__r__b__first__bit_axiom
  (assert (<= 0 test_constrained__r__b__first__bit))

;; test_constrained__r__b__last__bit_axiom
  (assert
  (< test_constrained__r__b__first__bit test_constrained__r__b__last__bit))

;; test_constrained__r__b__position_axiom
  (assert (<= 0 test_constrained__r__b__position))

(declare-const test_constrained__r__x__first__bit Int)

(declare-const test_constrained__r__x__last__bit Int)

(declare-const test_constrained__r__x__position Int)

;; test_constrained__r__x__first__bit_axiom
  (assert (<= 0 test_constrained__r__x__first__bit))

;; test_constrained__r__x__last__bit_axiom
  (assert
  (< test_constrained__r__x__first__bit test_constrained__r__x__last__bit))

;; test_constrained__r__x__position_axiom
  (assert (<= 0 test_constrained__r__x__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((r__ref 0))
(((r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a r__ref)) us_rep (r__content a))

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

(declare-const x__pointer_address Int)

(declare-const x__is_null_pointer Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const v__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_182 us_rep)
  (temp___skip_top_level_183 Bool)) Bool (and
                                         (= (rec__test_constrained__r__b
                                            (us_split_discrs1
                                            temp___expr_182)) (distinct 1 0))
                                         (= (to_rep
                                            (rec__test_constrained__r__x
                                            (us_split_fields1
                                            temp___expr_182))) 0)))

(declare-sort tr_aD1 0)

(declare-fun tr_aD1qtint (tr_aD1) Int)

;; tr_aD1'axiom
  (assert
  (forall ((i tr_aD1)) (and (<= 1 (tr_aD1qtint i)) (<= (tr_aD1qtint i) 10))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq2 (tr_aD1 tr_aD1) Bool)

(declare-const dummy2 tr_aD1)

(declare-datatypes ((tr_aD1__ref 0))
(((tr_aD1__refqtmk (tr_aD1__content tr_aD1)))))
(define-fun tr_aD1__ref_tr_aD1__content__projection ((a tr_aD1__ref)) tr_aD1 
  (tr_aD1__content a))

(define-fun default_initial_assumption1 ((temp___expr_201 (Array Int us_rep))
  (temp___skip_top_level_202 Bool)) Bool (forall ((temp___203 Int))
                                         (=>
                                         (and (<= 1 temp___203)
                                         (<= temp___203 10))
                                         (and
                                         (= (rec__test_constrained__r__b
                                            (us_split_discrs1
                                            (select temp___expr_201 temp___203))) (distinct 1 0))
                                         (= (to_rep
                                            (rec__test_constrained__r__x
                                            (us_split_fields1
                                            (select temp___expr_201 temp___203)))) 0)))))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (rec__test_constrained__r_a_acc__is_null_pointer Bool)(rec__test_constrained__r_a_acc__pointer_address Int)(rec__test_constrained__r_a_acc__pointer_value (Array Int us_rep))))))
(define-fun us_rep_rec__test_constrained__r_a_acc__is_null_pointer__projection ((a us_rep1)) Bool 
  (rec__test_constrained__r_a_acc__is_null_pointer a))

(define-fun us_rep_rec__test_constrained__r_a_acc__pointer_address__projection ((a us_rep1)) Int 
  (rec__test_constrained__r_a_acc__pointer_address a))

(define-fun us_rep_rec__test_constrained__r_a_acc__pointer_value__projection ((a us_rep1)) (Array Int us_rep) 
  (rec__test_constrained__r_a_acc__pointer_value a))

(declare-datatypes ((us_rep__ref 0))
(((us_rep__refqtmk (us_rep__content us_rep1)))))
(define-fun us_rep__ref___rep__content__2__projection ((a us_rep__ref)) us_rep1 
  (us_rep__content a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (rec__test_constrained__r_a_acc__is_null_pointer
                            a) (rec__test_constrained__r_a_acc__is_null_pointer
                               b))
                         (=>
                         (not
                         (= (rec__test_constrained__r_a_acc__is_null_pointer
                            a) true))
                         (and
                         (= (rec__test_constrained__r_a_acc__pointer_address
                            a) (rec__test_constrained__r_a_acc__pointer_address
                               b))
                         (= (rec__test_constrained__r_a_acc__pointer_value a) 
                         (rec__test_constrained__r_a_acc__pointer_value b)))))
                    true false))

(define-fun rec__test_constrained__r_a_acc__pointer_value__pred ((a us_rep1)) Bool 
  (not (= (rec__test_constrained__r_a_acc__is_null_pointer a) true)))

(declare-const us_null_pointer us_rep1)

;; __null_pointer__def_axiom
  (assert
  (= (rec__test_constrained__r_a_acc__is_null_pointer us_null_pointer) true))

(declare-const dummy3 us_rep1)

(declare-datatypes ((r_a_acc__ref 0))
(((r_a_acc__refqtmk (r_a_acc__content us_rep1)))))
(define-fun r_a_acc__ref_r_a_acc__content__projection ((a r_a_acc__ref)) us_rep1 
  (r_a_acc__content a))

(define-fun default_initial_assumption2 ((temp___expr_220 us_rep1)
  (temp___skip_top_level_221 Bool)) Bool (= (rec__test_constrained__r_a_acc__is_null_pointer
                                            temp___expr_220) true))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const test_constrained__r__b__first__bit1 Int)

(declare-const test_constrained__r__b__last__bit1 Int)

(declare-const test_constrained__r__b__position1 Int)

;; test_constrained__r__b__first__bit_axiom
  (assert (<= 0 test_constrained__r__b__first__bit1))

;; test_constrained__r__b__last__bit_axiom
  (assert
  (< test_constrained__r__b__first__bit1 test_constrained__r__b__last__bit1))

;; test_constrained__r__b__position_axiom
  (assert (<= 0 test_constrained__r__b__position1))

(declare-const test_constrained__r__x__first__bit1 Int)

(declare-const test_constrained__r__x__last__bit1 Int)

(declare-const test_constrained__r__x__position1 Int)

;; test_constrained__r__x__first__bit_axiom
  (assert (<= 0 test_constrained__r__x__first__bit1))

;; test_constrained__r__x__last__bit_axiom
  (assert
  (< test_constrained__r__x__first__bit1 test_constrained__r__x__last__bit1))

;; test_constrained__r__x__position_axiom
  (assert (<= 0 test_constrained__r__x__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t35b__ref 0))
(((t35b__refqtmk (t35b__content us_rep)))))
(define-fun t35b__ref_t35b__content__projection ((a t35b__ref)) us_rep 
  (t35b__content a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const test_constrained__r__b__first__bit2 Int)

(declare-const test_constrained__r__b__last__bit2 Int)

(declare-const test_constrained__r__b__position2 Int)

;; test_constrained__r__b__first__bit_axiom
  (assert (<= 0 test_constrained__r__b__first__bit2))

;; test_constrained__r__b__last__bit_axiom
  (assert
  (< test_constrained__r__b__first__bit2 test_constrained__r__b__last__bit2))

;; test_constrained__r__b__position_axiom
  (assert (<= 0 test_constrained__r__b__position2))

(declare-const test_constrained__r__x__first__bit2 Int)

(declare-const test_constrained__r__x__last__bit2 Int)

(declare-const test_constrained__r__x__position2 Int)

;; test_constrained__r__x__first__bit_axiom
  (assert (<= 0 test_constrained__r__x__first__bit2))

;; test_constrained__r__x__last__bit_axiom
  (assert
  (< test_constrained__r__x__first__bit2 test_constrained__r__x__last__bit2))

;; test_constrained__r__x__position_axiom
  (assert (<= 0 test_constrained__r__x__position2))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t36b__ref 0))
(((t36b__refqtmk (t36b__content us_rep)))))
(define-fun t36b__ref_t36b__content__projection ((a t36b__ref)) us_rep 
  (t36b__content a))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(assert
;; defqtvc
 ;; File "test_constrained.adb", line 1, characters 0-0
  (not (in_range 0)))
(check-sat)
(exit)
