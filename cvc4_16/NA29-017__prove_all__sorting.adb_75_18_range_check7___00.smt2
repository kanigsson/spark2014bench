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

(declare-fun perm2 (us_t us_t Int Int Int Int Int) Bool)

(declare-fun perm2__function_guard (Bool us_t us_t Int Int Int Int Int) Bool)

;; perm2__post_axiom
  (assert true)

(declare-fun le_array (us_t us_t Int Int Int Int) Bool)

(declare-fun le_array__function_guard (Bool us_t us_t Int Int Int Int) Bool)

;; le_array__post_axiom
  (assert true)

(declare-const a__first integer)

(declare-const a__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b__first integer)

(declare-const b__last integer)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const a_first Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const length11 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const length2 Int)

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
 ;; File "sorting.adb", line 59, characters 0-0
  (not
  (forall ((a (Array Int integer)) (b (Array Int integer)) (i Int) (j Int)
  (i1 Int) (j1 Int) (b1 (Array Int integer)))
  (=> (dynamic_property 0 2147483647 (to_rep a__first) (to_rep a__last))
  (=> (dynamic_property 0 2147483647 (to_rep b__first) (to_rep b__last))
  (=> (dynamic_invariant a_first true false true true)
  (=> (dynamic_invariant length11 true false true true)
  (=> (dynamic_invariant length2 true false true true)
  (=> (<= (to_rep a__first) a_first)
  (=> (<= (+ (+ a_first length11) length2) (+ (to_rep a__last) 1))
  (=> (<= (+ length11 length2) (length (to_rep b__first) (to_rep b__last)))
  (=> (<= (+ length11 length2) 2147483647)
  (=>
  (forall ((a1 (Array Int integer))) (sorted__function_guard
  (sorted (of_array a1 (to_rep a__first) (to_rep a__last)) a_first length11)
  (of_array a1 (to_rep a__first) (to_rep a__last)) a_first length11))
  (=>
  (= (sorted (of_array a (to_rep a__first) (to_rep a__last)) a_first
     length11) true)
  (=>
  (forall ((a1 (Array Int integer))) (sorted__function_guard
  (sorted (of_array a1 (to_rep a__first) (to_rep a__last))
  (+ a_first length11) length2)
  (of_array a1 (to_rep a__first) (to_rep a__last)) (+ a_first length11)
  length2))
  (=>
  (= (sorted (of_array a (to_rep a__first) (to_rep a__last))
     (+ a_first length11) length2) true)
  (=> (<= (to_rep b__first) (to_rep b__last))
  (=> (dynamic_invariant i false false true true)
  (=> (dynamic_invariant j false false true true)
  (=> (= i1 0)
  (=> (= j1 0)
  (=>
  (forall ((b2 (Array Int integer)) (i2 Int) (j2 Int))
  (sorted__function_guard
  (sorted (of_array b2 (to_rep b__first) (to_rep b__last)) (to_rep b__first)
  (+ i2 j2)) (of_array b2 (to_rep b__first) (to_rep b__last))
  (to_rep b__first) (+ i2 j2)))
  (=>
  (forall ((a1 (Array Int integer)) (b2 (Array Int integer)) (i2 Int)
  (j2 Int)) (perm2__function_guard
  (perm2 (of_array a1 (to_rep a__first) (to_rep a__last))
  (of_array b2 (to_rep b__first) (to_rep b__last)) a_first
  (+ a_first length11) (to_rep b__first) i2 j2)
  (of_array a1 (to_rep a__first) (to_rep a__last))
  (of_array b2 (to_rep b__first) (to_rep b__last)) a_first
  (+ a_first length11) (to_rep b__first) i2 j2))
  (=>
  (forall ((a1 (Array Int integer)) (b2 (Array Int integer)) (i2 Int)
  (j2 Int)) (le_array__function_guard
  (le_array (of_array b2 (to_rep b__first) (to_rep b__last))
  (of_array a1 (to_rep a__first) (to_rep a__last)) (to_rep b__first)
  (+ a_first i2) (+ i2 j2) (- length11 i2))
  (of_array b2 (to_rep b__first) (to_rep b__last))
  (of_array a1 (to_rep a__first) (to_rep a__last)) (to_rep b__first)
  (+ a_first i2) (+ i2 j2) (- length11 i2)))
  (=>
  (forall ((a1 (Array Int integer)) (b2 (Array Int integer)) (i2 Int)
  (j2 Int)) (le_array__function_guard
  (le_array (of_array b2 (to_rep b__first) (to_rep b__last))
  (of_array a1 (to_rep a__first) (to_rep a__last)) (to_rep b__first)
  (+ (+ a_first length11) j2) (+ i2 j2) (- length2 j2))
  (of_array b2 (to_rep b__first) (to_rep b__last))
  (of_array a1 (to_rep a__first) (to_rep a__last)) (to_rep b__first)
  (+ (+ a_first length11) j2) (+ i2 j2) (- length2 j2)))
  (=>
  (exists ((temp___loop_entry_325 (Array Int integer)))
  (and (= temp___loop_entry_325 a)
  (exists ((o Int))
  (and (= (to_rep a__last) o)
  (exists ((o1 Int))
  (and (= (to_rep a__first) o1)
  (exists ((o2 Int))
  (and (= (to_rep a__last) o2)
  (exists ((o3 Int))
  (and (= (to_rep a__first) o3)
  (let ((o4 (- length2 j1)))
  (and (in_range1 o4)
  (and (in_range2 o4)
  (let ((o5 (+ i1 j1)))
  (and (in_range1 o5)
  (let ((o6 (+ a_first length11)))
  (and (in_range1 o6)
  (let ((o7 (+ o6 j1)))
  (and (in_range1 o7)
  (exists ((o8 Int))
  (and (= (to_rep b__first) o8)
  (and (in_range2 o8)
  (exists ((o9 Int))
  (and (= (to_rep a__last) o9)
  (exists ((o10 Int))
  (and (= (to_rep a__first) o10)
  (let ((o11 (of_array a o10 o9)))
  (exists ((o12 Int))
  (and (= (to_rep b__last) o12)
  (exists ((o13 Int))
  (and (= (to_rep b__first) o13)
  (let ((o14 (of_array b o13 o12)))
  (and (le_array__function_guard (le_array o14 o11 o8 o7 o5 o4) o14 o11 o8 o7
  o5 o4)
  (let ((o15 (- length11 i1)))
  (and (in_range1 o15)
  (and (in_range2 o15)
  (let ((o16 (+ i1 j1)))
  (and (in_range1 o16)
  (let ((o17 (+ a_first i1)))
  (and (in_range1 o17)
  (exists ((o18 Int))
  (and (= (to_rep b__first) o18)
  (and (in_range2 o18)
  (exists ((o19 Int))
  (and (= (to_rep a__last) o19)
  (exists ((o20 Int))
  (and (= (to_rep a__first) o20)
  (let ((o21 (of_array a o20 o19)))
  (exists ((o22 Int))
  (and (= (to_rep b__last) o22)
  (exists ((o23 Int))
  (and (= (to_rep b__first) o23)
  (let ((o24 (of_array b o23 o22)))
  (and (le_array__function_guard (le_array o24 o21 o18 o17 o16 o15) o24 o21
  o18 o17 o16 o15)
  (exists ((o25 Int))
  (and (= (to_rep b__first) o25)
  (and (in_range2 o25)
  (let ((o26 (+ a_first length11)))
  (and (in_range1 o26)
  (let ((o27 a_first))
  (exists ((o28 Int))
  (and (= (to_rep b__last) o28)
  (exists ((o29 Int))
  (and (= (to_rep b__first) o29)
  (let ((o30 (of_array b o29 o28)))
  (exists ((o31 Int))
  (and (= (to_rep a__last) o31)
  (exists ((o32 Int))
  (and (= (to_rep a__first) o32)
  (let ((o33 (of_array a o32 o31)))
  (and (perm2__function_guard (perm2 o33 o30 o27 o26 o25 i1 j1) o33 o30 o27
  o26 o25 i1 j1)
  (let ((o34 (+ i1 j1)))
  (and (in_range1 o34)
  (exists ((o35 Int))
  (and (= (to_rep b__first) o35)
  (and (in_range2 o35)
  (exists ((o36 Int))
  (and (= (to_rep b__last) o36)
  (exists ((o37 Int))
  (and (= (to_rep b__first) o37)
  (let ((o38 (of_array b o37 o36)))
  (and (sorted__function_guard (sorted o38 o35 o34) o38 o35 o34)
  (exists ((b2 (Array Int integer)) (i2 Int) (j2 Int))
  (and
  (and
  (and
  (and
  (and
  (and (and (<= i2 length11) (<= j2 length2))
  (= (sorted (of_array b2 (to_rep b__first) (to_rep b__last))
     (to_rep b__first) (+ i2 j2)) true))
  (= (perm2 (of_array a (to_rep a__first) (to_rep a__last))
     (of_array b2 (to_rep b__first) (to_rep b__last)) a_first
     (+ a_first length11) (to_rep b__first) i2 j2) true))
  (= (le_array (of_array b2 (to_rep b__first) (to_rep b__last))
     (of_array a (to_rep a__first) (to_rep a__last)) (to_rep b__first)
     (+ a_first i2) (+ i2 j2) (- length11 i2)) true))
  (= (le_array (of_array b2 (to_rep b__first) (to_rep b__last))
     (of_array a (to_rep a__first) (to_rep a__last)) (to_rep b__first)
     (+ (+ a_first length11) j2) (+ i2 j2) (- length2 j2)) true))
  (= (bool_eq a (to_rep a__first) (to_rep a__last) temp___loop_entry_325
     (to_rep a__first) (to_rep a__last)) true))
  (and
  (and (dynamic_invariant i2 false true true true) (dynamic_invariant j2
  false true true true))
  (and (not (=> (not (< i2 length11)) (< j2 length2))) (= b1 b2)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
  (let ((o a_first))
  (let ((o1 (+ length11 length2)))
  (=> (in_range1 o1)
  (forall ((o2 Int))
  (=> (= (to_rep b__first) o2)
  (=> (in_range2 o2)
  (forall ((o3 Int))
  (=> (= (to_rep b__last) o3)
  (forall ((o4 Int))
  (=> (= (to_rep b__first) o4)
  (forall ((a1 (Array Int integer)) (o5 (Array Int integer)))
  (=> (= o5 a1)
  (=>
  (forall ((j2 Int))
  (=> (and (<= (to_rep a__first) j2) (<= j2 (to_rep a__last)))
  (and
  (=> (and (<= o j2) (<= j2 (- (+ o o1) 1)))
  (= (to_rep (select o5 j2)) (to_rep
                             (select (to_array (of_array b1 o4 o3)) (- (+ o2 j2) o)))))
  (=>
  (= (not (and (ite (<= o j2) true false) (ite (<= j2 (- (+ o o1) 1)) true
                                          false))) true)
  (= (to_rep (select o5 j2)) (to_rep (select a j2)))))))
  (=> (<= (to_rep a__first) (to_rep a__last)) (<= 0 (to_rep a__first))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
