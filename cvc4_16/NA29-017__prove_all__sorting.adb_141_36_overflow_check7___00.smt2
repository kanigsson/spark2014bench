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

;; Div_unique
  (assert
  (forall ((x Int) (y Int) (q Int))
  (=> (< 0 y) (=> (and (<= (* q y) x) (< x (+ (* q y) y))) (= (div x y) q)))))

;; Div_bound
  (assert
  (forall ((x Int) (y Int))
  (=> (and (<= 0 x) (< 0 y)) (and (<= 0 (div x y)) (<= (div x y) x)))))

;; Div_inf
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (< x y)) (= (div x y) 0))))

;; Div_inf_neg
  (assert
  (forall ((x Int) (y Int))
  (=> (and (< 0 x) (<= x y)) (= (div (- x) y) (- 1)))))

;; Mod_0
  (assert (forall ((y Int)) (=> (not (= y 0)) (= (mod 0 y) 0))))

;; Div_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div 1 y) 0))))

;; Div_minus1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (div (- 1) y) (- 1)))))

;; Mod_1_left
  (assert (forall ((y Int)) (=> (< 1 y) (= (mod 1 y) 1))))

;; Mod_minus1_left
  (assert
  (forall ((y Int))
  (! (=> (< 1 y) (= (mod (- 1) y) (- y 1))) :pattern ((mod (- 1) y)) )))

;; Div_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (div (+ (* x y) z) x) (+ y (div z x)))) :pattern ((div (+ (* x y) z) x)) )))

;; Mod_mult
  (assert
  (forall ((x Int) (y Int) (z Int))
  (! (=> (< 0 x) (= (mod (+ (* x y) z) x) (mod z x))) :pattern ((mod (+ (* x y) z) x)) )))

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

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
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

(declare-fun user_eq2 (us_t us_t) Bool)

(declare-const dummy2 us_t)

(declare-datatypes ((int_array__ref 0))
(((int_array__refqtmk (int_array__content us_t)))))
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

(assert
;; defqtvc
 ;; File "sorting.ads", line 17, characters 0-0
  (not
  (forall ((a (Array Int integer)) (i Int) (l Int) (k Int)
  (temp___loop_entry_260 (Array Int integer))
  (temp___loop_entry_281 (Array Int integer)))
  (=> (dynamic_property 0 2147483647 (to_rep a__first) (to_rep a__last))
  (=> (dynamic_invariant a_first true false true true)
  (=> (dynamic_invariant length2 true false true true)
  (=> (dynamic_property 0 2147483647 (to_rep b__first) (to_rep b__last))
  (=> (<= (to_rep a__first) a_first)
  (=> (<= (+ a_first length2) (+ (to_rep a__last) 1))
  (=> (<= length2 (length (to_rep b__first) (to_rep b__last)))
  (=> (dynamic_invariant i false false true true)
  (=> (dynamic_invariant l false false true true)
  (=> (dynamic_invariant k false false true true)
  (=> (= temp___loop_entry_260 a)
  (=> (= temp___loop_entry_281 a)
  (let ((o length2))
  (let ((o1 a_first))
  (forall ((o2 Int))
  (=> (= (to_rep a__last) o2)
  (forall ((o3 Int))
  (=> (= (to_rep a__first) o3)
  (let ((o4 (of_array a o3 o2)))
  (forall ((o5 Int))
  (=> (= (to_rep a__last) o5)
  (forall ((o6 Int))
  (=> (= (to_rep a__first) o6)
  (let ((o7 (of_array temp___loop_entry_281 o6 o5)))
  (=> (perm__function_guard (perm o7 o4 o1 o) o7 o4 o1 o)
  (forall ((a1 (Array Int integer)) (i1 Int) (l1 Int) (k1 Int))
  (=>
  (forall ((a2 (Array Int integer)) (l2 Int) (j Int)) (sorted__function_guard
  (sorted (of_array a2 (to_rep a__first) (to_rep a__last))
  (+ a_first (* j l2)) (min l2 (- length2 (* j l2))))
  (of_array a2 (to_rep a__first) (to_rep a__last)) (+ a_first (* j l2))
  (min l2 (- length2 (* j l2)))))
  (=>
  (forall ((temp___loop_entry_2811 (Array Int integer))
  (a2 (Array Int integer))) (perm__function_guard
  (perm (of_array temp___loop_entry_2811 (to_rep a__first) (to_rep a__last))
  (of_array a2 (to_rep a__first) (to_rep a__last)) a_first length2)
  (of_array temp___loop_entry_2811 (to_rep a__first) (to_rep a__last))
  (of_array a2 (to_rep a__first) (to_rep a__last)) a_first length2))
  (=>
  (and
  (and
  (forall ((j Int))
  (=> (and (<= 0 j) (<= j 2147483647))
  (=> (< (* j l1) length2)
  (= (sorted (of_array a1 (to_rep a__first) (to_rep a__last))
     (+ a_first (* j l1)) (min l1 (- length2 (* j l1)))) true))))
  (= (perm
     (of_array temp___loop_entry_281 (to_rep a__first) (to_rep a__last))
     (of_array a1 (to_rep a__first) (to_rep a__last)) a_first length2) true))
  (<= 1 l1))
  (=>
  (and
  (and (dynamic_invariant k1 false true true true) (dynamic_invariant i1
  false true true true)) (dynamic_invariant l1 false true true true))
  (forall ((i2 Int))
  (=> (= i2 0)
  (let ((o8 length2))
  (let ((o9 a_first))
  (forall ((o10 Int))
  (=> (= (to_rep a__last) o10)
  (forall ((o11 Int))
  (=> (= (to_rep a__first) o11)
  (let ((o12 (of_array a1 o11 o10)))
  (forall ((o13 Int))
  (=> (= (to_rep a__last) o13)
  (forall ((o14 Int))
  (=> (= (to_rep a__first) o14)
  (let ((o15 (of_array temp___loop_entry_260 o14 o13)))
  (=> (perm__function_guard (perm o15 o12 o9 o8) o15 o12 o9 o8)
  (=> (in_range1 (* l1 2))
  (forall ((a2 (Array Int integer)) (i3 Int) (k2 Int))
  (=>
  (forall ((l2 Int) (a3 (Array Int integer)) (j Int)) (sorted__function_guard
  (sorted (of_array a3 (to_rep a__first) (to_rep a__last))
  (+ a_first (* (* j l2) 2)) (min (* l2 2) (- length2 (* (* j l2) 2))))
  (of_array a3 (to_rep a__first) (to_rep a__last)) (+ a_first (* (* j l2) 2))
  (min (* l2 2) (- length2 (* (* j l2) 2)))))
  (=>
  (forall ((l2 Int) (a3 (Array Int integer)) (i4 Int) (j Int))
  (sorted__function_guard
  (sorted (of_array a3 (to_rep a__first) (to_rep a__last))
  (+ (+ a_first i4) (* j l2)) (min l2 (- (- length2 i4) (* j l2))))
  (of_array a3 (to_rep a__first) (to_rep a__last))
  (+ (+ a_first i4) (* j l2)) (min l2 (- (- length2 i4) (* j l2)))))
  (=>
  (forall ((temp___loop_entry_2601 (Array Int integer))
  (a3 (Array Int integer))) (perm__function_guard
  (perm (of_array temp___loop_entry_2601 (to_rep a__first) (to_rep a__last))
  (of_array a3 (to_rep a__first) (to_rep a__last)) a_first length2)
  (of_array temp___loop_entry_2601 (to_rep a__first) (to_rep a__last))
  (of_array a3 (to_rep a__first) (to_rep a__last)) a_first length2))
  (=>
  (and
  (and
  (and
  (and (and (<= i3 length2) (=> (< i3 length2) (= (mod2 i3 (* l1 2)) 0)))
  (forall ((j Int))
  (=> (and (<= 0 j) (<= j 2147483647))
  (=> (< (* (* j l1) 2) i3)
  (= (sorted (of_array a2 (to_rep a__first) (to_rep a__last))
     (+ a_first (* (* j l1) 2)) (min (* l1 2) (- length2 (* (* j l1) 2)))) true)))))
  (forall ((j Int))
  (=> (and (<= 0 j) (<= j 2147483647))
  (=> (< (* j l1) (- length2 i3))
  (= (sorted (of_array a2 (to_rep a__first) (to_rep a__last))
     (+ (+ a_first i3) (* j l1)) (min l1 (- (- length2 i3) (* j l1)))) true)))))
  (= (perm
     (of_array temp___loop_entry_260 (to_rep a__first) (to_rep a__last))
     (of_array a2 (to_rep a__first) (to_rep a__last)) a_first length2) true))
  (<= 1 l1))
  (=>
  (and (dynamic_invariant k2 false true true true) (dynamic_invariant i3
  false true true true))
  (let ((o16 (- length2 l1)))
  (=> (in_range1 o16)
  (=> (< i3 o16)
  (let ((o17 (- length2 l1)))
  (=> (in_range1 o17)
  (let ((o18 (- o17 i3)))
  (=> (in_range1 o18)
  (let ((o19 (min l1 o18)))
  (=> (in_range2 o19)
  (forall ((k3 Int))
  (=> (= k3 o19)
  (let ((o20 (+ a_first i3)))
  (=> (in_range1 o20)
  (let ((o21 a__last))
  (let ((o22 a__first))
  (forall ((a3 (Array Int integer)) (o23 (Array Int integer)))
  (=> (= o23 a3)
  (=>
  (forall ((l2 Int) (k4 Int) (o24 Int) (o25 integer) (o26 integer)
  (o27 (Array Int integer))) (sorted__function_guard
  (sorted (of_array o27 (to_rep o26) (to_rep o25)) o24 (+ l2 k4))
  (of_array o27 (to_rep o26) (to_rep o25)) o24 (+ l2 k4)))
  (=>
  (forall ((l2 Int) (a4 (Array Int integer)) (k4 Int) (o24 Int) (o25 integer)
  (o26 integer) (o27 (Array Int integer))) (perm__function_guard
  (perm (of_array a4 (to_rep o26) (to_rep o25))
  (of_array o27 (to_rep o26) (to_rep o25)) o24 (+ l2 k4))
  (of_array a4 (to_rep o26) (to_rep o25))
  (of_array o27 (to_rep o26) (to_rep o25)) o24 (+ l2 k4)))
  (=>
  (and
  (and
  (= (sorted (of_array o23 (to_rep o22) (to_rep o21)) o20 (+ l1 k3)) true)
  (= (perm (of_array a2 (to_rep o22) (to_rep o21))
     (of_array o23 (to_rep o22) (to_rep o21)) o20 (+ l1 k3)) true))
  (forall ((k4 Int))
  (=> (and (<= (to_rep o22) k4) (<= k4 (to_rep o21)))
  (=>
  (= (not (and (ite (<= o20 k4) true false) (ite (<= k4 (- (+ (+ o20 l1) k3) 1))
                                            true false))) true)
  (= (to_rep (select o23 k4)) (to_rep (select a2 k4)))))))
  (let ((o24 (+ l1 k3)))
  (=> (in_range1 o24)
  (let ((o25 (+ i3 o24)))
  (=> (in_range1 o25)
  (forall ((i4 Int))
  (=> (= i4 o25)
  (let ((o26 length2))
  (let ((o27 a_first))
  (forall ((o28 Int))
  (=> (= (to_rep a__last) o28)
  (forall ((o29 Int))
  (=> (= (to_rep a__first) o29)
  (let ((o30 (of_array a3 o29 o28)))
  (forall ((o31 Int))
  (=> (= (to_rep a__last) o31)
  (forall ((o32 Int))
  (=> (= (to_rep a__first) o32)
  (let ((o33 (of_array temp___loop_entry_260 o32 o31)))
  (=> (perm__function_guard (perm o33 o30 o27 o26) o33 o30 o27 o26)
  (forall ((usf Int))
  (=>
  (= (and (ite (<= 0 usf) true false) (ite (<= usf 2147483647) true false)) true)
  (let ((o34 (- length2 i4)))
  (=> (in_range1 o34)
  (let ((o35 (* usf l1)))
  (=> (in_range1 o35)
  (=> (< o35 o34)
  (let ((o36 (* usf l1)))
  (=> (in_range1 o36)
  (let ((o37 (- length2 i4)))
  (=> (in_range1 o37)
  (let ((o38 (- o37 o36)))
  (=> (in_range1 o38)
  (=> (in_range2 (min l1 o38))
  (=> (in_range1 (* usf l1)) (in_range1 (+ a_first i4)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
