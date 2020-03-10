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

(declare-sort character 0)

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 255)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (character character) Bool)

(declare-const dummy character)

(declare-datatypes ((character__ref 0))
(((character__refqtmk (character__content character)))))
(define-fun character__ref_character__content__projection ((a character__ref)) character 
  (character__content a))

(declare-fun to_rep (character) Int)

(declare-fun of_rep (Int) character)

;; inversion_axiom
  (assert
  (forall ((x character))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x character)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int character))))))
(declare-fun slide ((Array Int character) Int Int) (Array Int character))

;; slide_eq
  (assert
  (forall ((a (Array Int character)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int character)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int character)) (a__first Int) (a__last Int)
  (b (Array Int character)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_91 Int))
                           (=>
                           (and (<= a__first temp___idx_91)
                           (<= temp___idx_91 a__last))
                           (= (to_rep (select a temp___idx_91)) (to_rep
                                                                (select b (+ (- b__first a__first) temp___idx_91)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int character)) (b (Array Int character)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_91 Int))
  (=> (and (<= a__first temp___idx_91) (<= temp___idx_91 a__last))
  (= (to_rep (select a temp___idx_91)) (to_rep
                                       (select b (+ (- b__first a__first) temp___idx_91)))))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (integer integer) Bool)

(declare-const dummy1 integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int integer))))))
(declare-fun slide1 ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int integer)) (a__first Int) (a__last Int)
  (b (Array Int integer)) (b__first Int)
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
  (forall ((a (Array Int integer)) (b (Array Int integer)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const my_a (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const my_b (Array Int integer))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-sort tTmy_aSP1 0)

(declare-fun tTmy_aSP1qtint (tTmy_aSP1) Int)

;; tTmy_aSP1'axiom
  (assert
  (forall ((i tTmy_aSP1))
  (and (<= 1 (tTmy_aSP1qtint i)) (<= (tTmy_aSP1qtint i) 4))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (tTmy_aSP1 tTmy_aSP1) Bool)

(declare-const dummy2 tTmy_aSP1)

(declare-datatypes ((tTmy_aSP1__ref 0))
(((tTmy_aSP1__refqtmk (tTmy_aSP1__content tTmy_aSP1)))))
(define-fun tTmy_aSP1__ref_tTmy_aSP1__content__projection ((a tTmy_aSP1__ref)) tTmy_aSP1 
  (tTmy_aSP1__content a))

(declare-fun pack__a1__my_a__aggregate_def (Int) (Array Int integer))

(declare-sort tTmy_bSP1 0)

(declare-fun tTmy_bSP1qtint (tTmy_bSP1) Int)

;; tTmy_bSP1'axiom
  (assert
  (forall ((i tTmy_bSP1))
  (and (<= 1 (tTmy_bSP1qtint i)) (<= (tTmy_bSP1qtint i) 4))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (tTmy_bSP1 tTmy_bSP1) Bool)

(declare-const dummy3 tTmy_bSP1)

(declare-datatypes ((tTmy_bSP1__ref 0))
(((tTmy_bSP1__refqtmk (tTmy_bSP1__content tTmy_bSP1)))))
(define-fun tTmy_bSP1__ref_tTmy_bSP1__content__projection ((a tTmy_bSP1__ref)) tTmy_bSP1 
  (tTmy_bSP1__content a))

(declare-sort t15b 0)

(declare-fun t15bqtint (t15b) Int)

;; t15b'axiom
  (assert
  (forall ((i t15b)) (and (<= 1 (t15bqtint i)) (<= (t15bqtint i) 4))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq4 (t15b t15b) Bool)

(declare-const dummy4 t15b)

(declare-datatypes ((t15b__ref 0))
(((t15b__refqtmk (t15b__content t15b)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) t15b 
  (t15b__content a))

(declare-sort t17b 0)

(declare-fun t17bqtint (t17b) Int)

;; t17b'axiom
  (assert
  (forall ((i t17b)) (and (<= 1 (t17bqtint i)) (<= (t17bqtint i) 4))))

(define-fun in_range6 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq5 (t17b t17b) Bool)

(declare-const dummy5 t17b)

(declare-datatypes ((t17b__ref 0))
(((t17b__refqtmk (t17b__content t17b)))))
(define-fun t17b__ref_t17b__content__projection ((a t17b__ref)) t17b 
  (t17b__content a))

(declare-sort t19b 0)

(declare-fun t19bqtint (t19b) Int)

;; t19b'axiom
  (assert
  (forall ((i t19b)) (and (<= 1 (t19bqtint i)) (<= (t19bqtint i) 4))))

(define-fun in_range7 ((x Int)) Bool (and (<= 1 x) (<= x 4)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq6 (t19b t19b) Bool)

(declare-const dummy6 t19b)

(declare-datatypes ((t19b__ref 0))
(((t19b__refqtmk (t19b__content t19b)))))
(define-fun t19b__ref_t19b__content__projection ((a t19b__ref)) t19b 
  (t19b__content a))

(declare-fun pack__a1__my_s1__aggregate_def (Int) (Array Int character))

(declare-fun temp_____aggregate_def_411 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_421 (Int) (Array Int integer))

(declare-fun temp_____aggregate_def_431 (Int) (Array Int integer))

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range2 temp___expr_18)))

(define-fun dynamic_invariant1 ((temp___expr_74 Int) (temp___is_init_70 Bool)
  (temp___skip_constant_71 Bool) (temp___do_toplevel_72 Bool)
  (temp___do_typ_inv_73 Bool)) Bool (=>
                                    (or (= temp___is_init_70 true)
                                    (<= 0 255)) (in_range1 temp___expr_74)))

;; def_axiom
  (assert
  (forall ((temp___407 Int))
  (=> (dynamic_invariant1 temp___407 true true true true)
  (forall ((temp___408 Int))
  (= (to_rep (select (pack__a1__my_s1__aggregate_def temp___407) temp___408)) temp___407)))))

;; my_a__def_axiom
  (assert (= my_a (pack__a1__my_a__aggregate_def 42)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 42))

;; def_axiom
  (assert
  (forall ((temp___158 Int))
  (=> (dynamic_invariant temp___158 true true true true)
  (forall ((temp___159 Int))
  (= (select (pack__a1__my_a__aggregate_def temp___158) temp___159) rliteral)))))

;; my_b__def_axiom
  (assert (= my_b (let ((temp___161 4)) (let ((temp___160 1)) my_a))))

;; def_axiom
  (assert
  (forall ((temp___413 Int))
  (=> (dynamic_invariant temp___413 true true true true)
  (forall ((temp___414 Int))
  (= (select (temp_____aggregate_def_411 temp___413) temp___414) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___423 Int))
  (=> (dynamic_invariant temp___423 true true true true)
  (forall ((temp___424 Int))
  (= (select (temp_____aggregate_def_421 temp___423) temp___424) rliteral)))))

;; def_axiom
  (assert
  (forall ((temp___433 Int))
  (=> (dynamic_invariant temp___433 true true true true)
  (forall ((temp___434 Int))
  (= (select (temp_____aggregate_def_431 temp___433) temp___434) rliteral)))))

(assert
;; defqtvc
 ;; File "pack.ads", line 3, characters 0-0
  (not
  (forall ((glob (Array Int character)) (o Int)
  (my_s1 (Array Int character)))
  (=> (= (to_rep (select glob 1)) o)
  (=> (= my_s1 (pack__a1__my_s1__aggregate_def o))
  (=> (= (pack__a1__my_a__aggregate_def 42) my_a)
  (=> (=> (<= 1 4) (and (and (<= 1 1) (<= 1 4)) (and (<= 1 4) (<= 4 4))))
  (=> (= my_a my_b)
  (= (bool_eq1 my_a 1 4 (temp_____aggregate_def_411 42) 1 4) true)))))))))
(check-sat)
(exit)
