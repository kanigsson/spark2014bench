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

(define-fun length ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun div1 (Int Int) Int)

(declare-fun mod1 (Int Int) Int)

;; Div_mod
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (= x (+ (* y (div1 x y)) (mod1 x y))))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div1 x y)) (<= (div1 x y) x)))))

;; Mod_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0))
  (and (< (- (abs1 y)) (mod1 x y)) (< (mod1 x y) (abs1 y))))))

;; Div_sign_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< 0 y)) (<= 0 (div1 x y)))))

;; Div_sign_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= x 0) (< 0 y)) (<= (div1 x y) 0))))

;; Mod_sign_pos
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (not (= y 0))) (<= 0 (mod1 x y)))))

;; Mod_sign_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= x 0) (not (= y 0))) (<= (mod1 x y) 0))))

;; Rounds_toward_zero
  (assert
  (forall ((x Int) (y Int))
  (=> (not (= y 0)) (<= (abs1 (* (div1 x y) y)) (abs1 x)))))

;; Div_1
  (assert (forall ((x Int)) (= (div1 x 1) x)))

;; Mod_1
  (assert (forall ((x Int)) (= (mod1 x 1) 0)))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div1 x y) 0))))

;; Mod_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (mod1 x y) x))))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (div1 (+ (* x y) z) x) (+ y (div1 z x)))) :pattern ((div1
                                                            (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (and (< 0 x) (and (<= 0 y) (<= 0 z)))
     (= (mod1 (+ (* x y) z) x) (mod1 z x))) :pattern ((mod1 (+ (* x y) z) x)) )))

(define-fun mod2 ((x Int)
  (y Int)) Int (ite (< 0 y) (mod x y) (+ (mod x y) y)))

(define-fun min ((x Int) (y Int)) Int (ite (<= x y) x y))

(define-fun max ((x Int) (y Int)) Int (ite (<= x y) y x))

;; Min_r
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (min x y) y))))

;; Max_l
  (assert (forall ((x Int) (y Int)) (=> (<= y x) (= (max x y) x))))

;; Min_comm
  (assert (forall ((x Int) (y Int)) (= (min x y) (min y x))))

;; Max_comm
  (assert (forall ((x Int) (y Int)) (= (max x y) (max y x))))

;; Min_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (min (min x y) z) (min x (min y z)))))

;; Max_assoc
  (assert
  (forall ((x Int) (y Int) (z Int)) (= (max (max x y) z) (max x (max y z)))))

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

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

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

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

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

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int integer))))))
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
                   (=> (<= low high) (and (in_range2 low) (in_range2 high))))))

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int integer))(rt t)))))
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

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ()
((int_array__ref (int_array__refqtmk (int_array__content us_t)))))
(define-fun int_array__ref_int_array__content__projection ((a int_array__ref)) us_t 
  (int_array__content a))

(declare-fun sorted (us_t Int Int) Bool)

(declare-fun sorted__function_guard (Bool us_t Int Int) Bool)

(define-fun dynamic_invariant1 ((temp___expr_163 us_t)
  (temp___is_init_159 Bool) (temp___skip_constant_160 Bool)
  (temp___do_toplevel_161 Bool)
  (temp___do_typ_inv_162 Bool)) Bool (=>
                                     (not (= temp___skip_constant_160 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_163)
                                     (last1 temp___expr_163))))

;; sorted__post_axiom
  (assert true)

(declare-fun perm (us_t us_t Int Int) Bool)

(declare-fun perm__function_guard (Bool us_t us_t Int Int) Bool)

;; perm__post_axiom
  (assert true)

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const a_first Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const length2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const b__first integer)

(declare-const b__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(define-fun dynamic_invariant2 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const a (Array Int integer))

(declare-const i Int)

(declare-const l Int)

(declare-const k Int)

(declare-const a1 (Array Int integer))

;; H
  (assert (= a1 a))

;; Assume
  (assert (dynamic_property 0 2147483647 (to_rep a__first) (to_rep a__last)))

;; Assume
  (assert (dynamic_invariant a_first true false true true))

;; Assume
  (assert (dynamic_invariant length2 true false true true))

;; Assume
  (assert (dynamic_property 0 2147483647 (to_rep b__first) (to_rep b__last)))

;; Assume
  (assert
  (and
  (and (<= (to_rep a__first) a_first)
  (<= (+ a_first length2) (+ (to_rep a__last) 1)))
  (<= length2 (length (to_rep b__first) (to_rep b__last)))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant i false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant l false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant k false false true true))

(declare-const l1 Int)

;; H
  (assert (= l1 1))

(declare-const temp___loop_entry_260 (Array Int integer))

;; H
  (assert (= temp___loop_entry_260 a))

(declare-const temp___loop_entry_265 (Array Int integer))

;; H
  (assert (= temp___loop_entry_265 a))

(declare-const temp___loop_entry_281 (Array Int integer))

;; H
  (assert (= temp___loop_entry_281 a))

(define-fun o () Int length2)

(define-fun o1 () Int a_first)

(declare-const o2 Int)

;; Ensures
  (assert (= (to_rep a__last) o2))

(declare-const o3 Int)

;; Ensures
  (assert (= (to_rep a__first) o3))

(define-fun o4 () us_t (of_array a o3 o2))

(declare-const o5 Int)

;; Ensures
  (assert (= (to_rep a__last) o5))

(declare-const o6 Int)

;; Ensures
  (assert (= (to_rep a__first) o6))

(define-fun o7 () us_t (of_array temp___loop_entry_281 o6 o5))

;; Ensures
  (assert (perm__function_guard (perm o7 o4 o1 o) o7 o4 o1 o))

(declare-const a2 (Array Int integer))

(declare-const i1 Int)

(declare-const l2 Int)

(declare-const k1 Int)

;; H
  (assert
  (forall ((a3 (Array Int integer)) (l3 Int) (j Int)) (sorted__function_guard
  (sorted (of_array a3 (to_rep a__first) (to_rep a__last))
  (+ a_first (* j l3)) (min l3 (- length2 (* j l3))))
  (of_array a3 (to_rep a__first) (to_rep a__last)) (+ a_first (* j l3))
  (min l3 (- length2 (* j l3))))))

;; H
  (assert
  (forall ((temp___loop_entry_2811 (Array Int integer))
  (a3 (Array Int integer))) (perm__function_guard
  (perm (of_array temp___loop_entry_2811 (to_rep a__first) (to_rep a__last))
  (of_array a3 (to_rep a__first) (to_rep a__last)) a_first length2)
  (of_array temp___loop_entry_2811 (to_rep a__first) (to_rep a__last))
  (of_array a3 (to_rep a__first) (to_rep a__last)) a_first length2)))

;; LoopInvariant
  (assert
  (and
  (and
  (forall ((j Int))
  (=> (and (<= 0 j) (<= j 2147483647))
  (=> (< (* j l2) length2)
  (= (sorted (of_array a2 (to_rep a__first) (to_rep a__last))
     (+ a_first (* j l2)) (min l2 (- length2 (* j l2)))) true))))
  (= (perm
     (of_array temp___loop_entry_281 (to_rep a__first) (to_rep a__last))
     (of_array a2 (to_rep a__first) (to_rep a__last)) a_first length2) true))
  (<= 1 l2)))

;; Assume
  (assert
  (and
  (and (dynamic_invariant k1 false true true true) (dynamic_invariant 
  i1 false true true true)) (dynamic_invariant l2 false true true true)))

(declare-const i2 Int)

;; H
  (assert (= i2 0))

(declare-const a3 (Array Int integer))

;; H
  (assert
  (forall ((l3 Int) (a4 (Array Int integer)) (j Int)) (sorted__function_guard
  (sorted (of_array a4 (to_rep a__first) (to_rep a__last))
  (+ a_first (* (* j l3) 2)) (min (* l3 2) (- length2 (* (* j l3) 2))))
  (of_array a4 (to_rep a__first) (to_rep a__last)) (+ a_first (* (* j l3) 2))
  (min (* l3 2) (- length2 (* (* j l3) 2))))))

;; H
  (assert
  (forall ((l3 Int) (a4 (Array Int integer)) (i3 Int) (j Int))
  (sorted__function_guard
  (sorted (of_array a4 (to_rep a__first) (to_rep a__last))
  (+ (+ a_first i3) (* j l3)) (min l3 (- (- length2 i3) (* j l3))))
  (of_array a4 (to_rep a__first) (to_rep a__last))
  (+ (+ a_first i3) (* j l3)) (min l3 (- (- length2 i3) (* j l3))))))

;; H
  (assert
  (forall ((temp___loop_entry_2601 (Array Int integer))
  (a4 (Array Int integer))) (perm__function_guard
  (perm (of_array temp___loop_entry_2601 (to_rep a__first) (to_rep a__last))
  (of_array a4 (to_rep a__first) (to_rep a__last)) a_first length2)
  (of_array temp___loop_entry_2601 (to_rep a__first) (to_rep a__last))
  (of_array a4 (to_rep a__first) (to_rep a__last)) a_first length2)))

;; H
  (assert false)

;; H
  (assert
  (forall ((temp___loop_entry_2651 (Array Int integer))
  (a4 (Array Int integer))) (perm__function_guard
  (perm (of_array temp___loop_entry_2651 (to_rep a__first) (to_rep a__last))
  (of_array a4 (to_rep a__first) (to_rep a__last)) a_first length2)
  (of_array temp___loop_entry_2651 (to_rep a__first) (to_rep a__last))
  (of_array a4 (to_rep a__first) (to_rep a__last)) a_first length2)))

(assert
;; defqtvc
 ;; File "sorting.ads", line 17, characters 0-0
  (not
  (= (perm
     (of_array temp___loop_entry_265 (to_rep a__first) (to_rep a__last))
     (of_array a3 (to_rep a__first) (to_rep a__last)) a_first length2) true)))
(check-sat)
