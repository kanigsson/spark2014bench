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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-sort int5 0)

(declare-fun int5qtint (int5) Int)

;; int5'axiom
  (assert
  (forall ((i int5)) (and (<= 1 (int5qtint i)) (<= (int5qtint i) 5))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (int5 int5) Bool)

(declare-const dummy1 int5)

(declare-datatypes ((int5__ref 0))
(((int5__refqtmk (int5__content int5)))))
(define-fun int5__ref_int5__content__projection ((a int5__ref)) int5 
  (int5__content a))

(define-fun to_rep ((x int5)) Int (int5qtint x))

(declare-fun of_rep (Int) int5)

;; inversion_axiom
  (assert
  (forall ((x int5)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x int5)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int int5))))))
(declare-fun slide ((Array Int int5) Int Int) (Array Int int5))

;; slide_eq
  (assert
  (forall ((a (Array Int int5)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int int5)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int int5)) (a__first Int) (a__last Int)
  (b (Array Int int5)) (b__first Int)
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
  (forall ((a (Array Int int5)) (b (Array Int int5)))
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

(declare-const dummy2 (Array Int int5))

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

(declare-fun user_eq2 ((Array Int int5) (Array Int int5)) Bool)

(declare-datatypes ((map__ref1 0))
(((map__refqtmk1 (map__content1 (Array Int (Array Int int5)))))))
(declare-fun slide1 ((Array Int (Array Int int5)) Int
  Int) (Array Int (Array Int int5)))

;; slide_eq
  (assert
  (forall ((a (Array Int (Array Int int5))))
  (forall ((first Int))
  (! (= (slide1 a first first) a) :pattern ((slide1 a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int (Array Int int5))))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide1 a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide1 a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int (Array Int int5))) (a__first Int)
  (a__last Int) (b (Array Int (Array Int int5))) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_156 Int))
                           (=>
                           (and (<= a__first temp___idx_156)
                           (<= temp___idx_156 a__last))
                           (= (bool_eq (select a temp___idx_156) 2 6
                              (select b (+ (- b__first a__first) temp___idx_156))
                              2 6) true))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int (Array Int int5))) (b (Array Int (Array Int int5))))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_156 Int))
  (=> (and (<= a__first temp___idx_156) (<= temp___idx_156 a__last))
  (= (bool_eq (select a temp___idx_156) 2 6
     (select b (+ (- b__first a__first) temp___idx_156)) 2 6) true))))))))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const n Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort int6 0)

(declare-fun int6qtint (int6) Int)

;; int6'axiom
  (assert
  (forall ((i int6)) (and (<= 1 (int6qtint i)) (<= (int6qtint i) 6))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 6)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq3 (int6 int6) Bool)

(declare-const dummy3 int6)

(declare-datatypes ((int6__ref 0))
(((int6__refqtmk (int6__content int6)))))
(define-fun int6__ref_int6__content__projection ((a int6__ref)) int6 
  (int6__content a))

(define-fun dynamic_invariant1 ((temp___expr_189 Int)
  (temp___is_init_185 Bool) (temp___skip_constant_186 Bool)
  (temp___do_toplevel_187 Bool)
  (temp___do_typ_inv_188 Bool)) Bool (=>
                                     (or (= temp___is_init_185 true)
                                     (<= 1 6)) (in_range3 temp___expr_189)))

(declare-sort ta26P1 0)

(declare-fun ta26P1qtint (ta26P1) Int)

;; ta26P1'axiom
  (assert
  (forall ((i ta26P1)) (and (<= 2 (ta26P1qtint i)) (<= (ta26P1qtint i) 6))))

(define-fun in_range4 ((x Int)) Bool (and (<= 2 x) (<= x 6)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (ta26P1 ta26P1) Bool)

(declare-const dummy4 ta26P1)

(declare-datatypes ((ta26P1__ref 0))
(((ta26P1__refqtmk (ta26P1__content ta26P1)))))
(define-fun ta26P1__ref_ta26P1__content__projection ((a ta26P1__ref)) ta26P1 
  (ta26P1__content a))

(declare-sort tar37P1 0)

(declare-fun tar37P1qtint (tar37P1) Int)

;; tar37P1'axiom
  (assert
  (forall ((i tar37P1))
  (and (<= 3 (tar37P1qtint i)) (<= (tar37P1qtint i) 7))))

(define-fun in_range5 ((x Int)) Bool (and (<= 3 x) (<= x 7)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (tar37P1 tar37P1) Bool)

(declare-const dummy5 tar37P1)

(declare-datatypes ((tar37P1__ref 0))
(((tar37P1__refqtmk (tar37P1__content tar37P1)))))
(define-fun tar37P1__ref_tar37P1__content__projection ((a tar37P1__ref)) tar37P1 
  (tar37P1__content a))

(declare-fun temp_____aggregate_def_282 ((Array Int int5)) (Array Int (Array Int int5)))

(declare-fun temp_____aggregate_def_286 (Int Int) (Array Int int5))

(define-fun dynamic_invariant2 ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (=>
                                     (or (= temp___is_init_178 true)
                                     (<= 1 5)) (in_range2 temp___expr_182)))

;; def_axiom
  (assert
  (forall ((temp___284 (Array Int int5)))
  (forall ((temp___285 Int))
  (= (select (temp_____aggregate_def_282 temp___284) temp___285) temp___284))))

(declare-const rliteral int5)

;; rliteral_axiom
  (assert (= (int5qtint rliteral) 1))

;; def_axiom
  (assert
  (forall ((temp___288 Int) (temp___289 Int))
  (let ((temp___287 (temp_____aggregate_def_286 temp___288 temp___289)))
  (=>
  (and (dynamic_invariant2 temp___288 true true true true)
  (dynamic_invariant2 temp___289 true true true true))
  (forall ((temp___290 Int))
  (ite (= temp___290 3) (= (select temp___287 temp___290) rliteral)
  (= (to_rep (select temp___287 temp___290)) temp___289)))))))

(assert
;; defqtvc
 ;; File "r.adb", line 38, characters 0-0
  (not
  (forall ((a (Array Int (Array Int int5))) (o Int) (i Int))
  (=> (dynamic_invariant n true false true true)
  (=> (<= 3 n)
  (=> (<= n 4)
  (=> (<= 3 n)
  (=> (<= n 7)
  (=> (<= 2 n)
  (=> (<= n 6)
  (=> (= (to_rep (select (select a n) n)) o)
  (=> (in_range3 o)
  (=> (= i o) (=> (dynamic_invariant1 i true false true true) (<= 3 n)))))))))))))))
(check-sat)
(exit)
