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
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int integer))))))
(declare-fun slide ((Array Int integer) Int Int) (Array Int integer))

;; slide_eq
  (assert
  (forall ((a (Array Int integer)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int integer)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int integer)) (a__first Int) (a__last Int)
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
                           (= (to_rep (select a temp___idx_154)) (to_rep
                                                                 (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int integer)) (b (Array Int integer)))
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

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-fun lcp (Int Int (Array Int integer)) Int)

(declare-fun lcp__function_guard (Int Int Int (Array Int integer)) Bool)

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun dynamic_invariant1 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(declare-sort t 0)

(declare-fun first (t) integer)

(declare-fun last (t) integer)

(declare-fun mk (Int Int) t)

;; mk_def
  (assert
  (forall ((f Int) (l Int))
  (! (=> (in_range f)
     (=> (in_range l)
     (and (= (to_rep (first (mk f l))) f) (= (to_rep (last (mk f l))) l)))) :pattern (
  (mk f l)) )))

(define-fun dynamic_property ((range_first Int) (range_last Int) (low Int)
  (high Int)) Bool (and (in_range low)
                   (and (in_range high)
                   (=> (<= low high) (and (in_range3 low) (in_range3 high))))))

(declare-datatypes ((us_t 0))
(((us_tqtmk (elts (Array Int integer))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int integer) (elts a))

(define-fun of_array ((a (Array Int integer)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length1 ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(declare-datatypes ((text__ref 0))
(((text__refqtmk (text__content us_t)))))
(define-fun text__ref_text__content__projection ((a text__ref)) us_t 
  (text__content a))

(declare-datatypes ((t8s__ref 0))
(((t8s__refqtmk (t8s__content us_t)))))
(define-fun t8s__ref_t8s__content__projection ((a t8s__ref)) us_t (t8s__content
                                                                  a))

(declare-datatypes ((t10s__ref 0))
(((t10s__refqtmk (t10s__content us_t)))))
(define-fun t10s__ref_t10s__content__projection ((a t10s__ref)) us_t 
  (t10s__content a))

;; lcp__post_axiom
  (assert
  (forall ((x Int) (y Int))
  (forall ((longest_common_prefix__a (Array Int integer)))
  (! (=>
     (and
     (and (dynamic_invariant1 x true true true true) (dynamic_invariant1 y
     true true true true))
     (and (and (<= 1 x) (<= x 1000)) (and (<= 1 y) (<= y 1000))))
     (let ((result (lcp x y longest_common_prefix__a)))
     (=> (lcp__function_guard result x y longest_common_prefix__a)
     (and
     (and
     (and
     (= (let ((temp___209 (let ((temp___205 (- (+ y result) 1)))
                          (of_array longest_common_prefix__a y temp___205))))
        (let ((temp___208 (let ((temp___204 (- (+ x result) 1)))
                          (of_array longest_common_prefix__a x temp___204))))
        (bool_eq (to_array temp___208) (first1 temp___208) (last1 temp___208)
        (to_array temp___209) (first1 temp___209) (last1 temp___209)))) true)
     (or
     (or
     (= (not (let ((temp___210 (+ result x)))
             (and (ite (<= 1 temp___210) true false) (ite (<= temp___210 1000)
                                                     true false)))) true)
     (= (not (let ((temp___211 (+ result y)))
             (and (ite (<= 1 temp___211) true false) (ite (<= temp___211 1000)
                                                     true false)))) true))
     (not
     (= (to_rep (select longest_common_prefix__a (+ x result))) (to_rep
                                                                (select longest_common_prefix__a (+ y result)))))))
     (ite (not
          (= (to_rep (select longest_common_prefix__a x)) (to_rep
                                                          (select longest_common_prefix__a y))))
     (= result 0) (ite (= x y) (= result (+ (- 1000 x) 1)) (< 0 result))))
     (dynamic_invariant result true false true true))))) :pattern ((lcp x y
                                                                   longest_common_prefix__a)) ))))

(declare-sort tTaSP1 0)

(declare-fun tTaSP1qtint (tTaSP1) Int)

;; tTaSP1'axiom
  (assert
  (forall ((i tTaSP1))
  (and (<= 1 (tTaSP1qtint i)) (<= (tTaSP1qtint i) 1000))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 1000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (tTaSP1 tTaSP1) Bool)

(declare-const dummy4 tTaSP1)

(declare-datatypes ((tTaSP1__ref 0))
(((tTaSP1__refqtmk (tTaSP1__content tTaSP1)))))
(define-fun tTaSP1__ref_tTaSP1__content__projection ((a tTaSP1__ref)) tTaSP1 
  (tTaSP1__content a))

(declare-sort t3b 0)

(declare-fun t3bqtint (t3b) Int)

;; t3b'axiom
  (assert (forall ((i t3b)) (and (<= 1 (t3bqtint i)) (<= (t3bqtint i) 5))))

(define-fun in_range5 ((x Int)) Bool (and (<= 1 x) (<= x 5)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (t3b t3b) Bool)

(declare-const dummy5 t3b)

(declare-datatypes ((t3b__ref 0))
(((t3b__refqtmk (t3b__content t3b)))))
(define-fun t3b__ref_t3b__content__projection ((a t3b__ref)) t3b (t3b__content
                                                                 a))

(declare-sort t5b 0)

(declare-fun t5bqtint (t5b) Int)

;; t5b'axiom
  (assert (forall ((i t5b)) (and (<= 6 (t5bqtint i)) (<= (t5bqtint i) 10))))

(define-fun in_range6 ((x Int)) Bool (and (<= 6 x) (<= x 10)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (t5b t5b) Bool)

(declare-const dummy6 t5b)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content t5b)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) t5b (t5b__content
                                                                 a))

(declare-fun temp_____aggregate_def_213 (Int Int Int Int Int Int Int Int Int
  Int Int) (Array Int integer))

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const rliteral integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral) 1))

(declare-const rliteral1 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral1) 2))

(declare-const rliteral2 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral2) 3))

(declare-const rliteral3 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral3) 4))

(declare-const rliteral4 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral4) 5))

(declare-const rliteral5 integer)

;; rliteral_axiom
  (assert (= (integerqtint rliteral5) 0))

;; def_axiom
  (assert
  (forall ((temp___215 Int) (temp___216 Int) (temp___217 Int)
  (temp___218 Int) (temp___219 Int) (temp___220 Int) (temp___221 Int)
  (temp___222 Int) (temp___223 Int) (temp___224 Int) (temp___225 Int))
  (let ((temp___214 (temp_____aggregate_def_213 temp___215 temp___216
                    temp___217 temp___218 temp___219 temp___220 temp___221
                    temp___222 temp___223 temp___224 temp___225)))
  (=>
  (and
  (and (dynamic_invariant2 temp___215 true true true true)
  (dynamic_invariant2 temp___216 true true true true))
  (and
  (and
  (and
  (and (dynamic_invariant2 temp___217 true true true true)
  (dynamic_invariant2 temp___218 true true true true)) (dynamic_invariant2
  temp___219 true true true true))
  (and (dynamic_invariant2 temp___220 true true true true)
  (dynamic_invariant2 temp___221 true true true true)))
  (and
  (and (dynamic_invariant2 temp___222 true true true true)
  (dynamic_invariant2 temp___223 true true true true))
  (and (dynamic_invariant2 temp___224 true true true true)
  (dynamic_invariant2 temp___225 true true true true)))))
  (forall ((temp___226 Int))
  (ite (= temp___226 1) (= (select temp___214 temp___226) rliteral)
  (ite (= temp___226 2) (= (select temp___214 temp___226) rliteral1)
  (ite (= temp___226 3) (= (select temp___214 temp___226) rliteral2)
  (ite (= temp___226 4) (= (select temp___214 temp___226) rliteral3)
  (ite (= temp___226 5) (= (select temp___214 temp___226) rliteral4)
  (ite (= temp___226 6) (= (select temp___214 temp___226) rliteral)
  (ite (= temp___226 7) (= (select temp___214 temp___226) rliteral1)
  (ite (= temp___226 8) (= (select temp___214 temp___226) rliteral2)
  (ite (= temp___226 9) (= (select temp___214 temp___226) rliteral3)
  (ite (= temp___226 10) (= (select temp___214 temp___226) rliteral4)
  (= (select temp___214 temp___226) rliteral5))))))))))))))))

(assert
;; defqtvc
 ;; File "main.adb", line 3, characters 0-0
  (not
  (forall ((a (Array Int integer)))
  (=> (= a (temp_____aggregate_def_213 1 2 3 4 5 1 2 3 4 5 0))
  (=> (= (bool_eq a 1 5 a 6 10) true)
  (=>
  (forall ((a1 (Array Int integer))) (lcp__function_guard (lcp 1 6 a1) 1 6
  a1)) (=> (= (lcp 1 6 a) 5) (<= 1 1))))))))
(check-sat)
(exit)
