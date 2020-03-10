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

(declare-fun power (Int Int) Int)

;; Power_0
  (assert (forall ((x Int)) (= (power x 0) 1)))

;; Power_s
  (assert
  (forall ((x Int) (n Int))
  (=> (<= 0 n) (= (power x (+ n 1)) (* x (power x n))))))

;; Power_s_alt
  (assert
  (forall ((x Int) (n Int))
  (=> (< 0 n) (= (power x n) (* x (power x (- n 1)))))))

;; Power_1
  (assert (forall ((x Int)) (= (power x 1) x)))

;; Power_sum
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (<= 0 n)
  (=> (<= 0 m) (= (power x (+ n m)) (* (power x n) (power x m)))))))

;; Power_mult
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (<= 0 n) (=> (<= 0 m) (= (power x (* n m)) (power (power x n) m))))))

;; Power_comm1
  (assert
  (forall ((x Int) (y Int))
  (=> (= (* x y) (* y x))
  (forall ((n Int)) (=> (<= 0 n) (= (* (power x n) y) (* y (power x n))))))))

;; Power_comm2
  (assert
  (forall ((x Int) (y Int))
  (=> (= (* x y) (* y x))
  (forall ((n Int))
  (=> (<= 0 n) (= (power (* x y) n) (* (power x n) (power y n))))))))

;; Power_non_neg
  (assert
  (forall ((x Int) (y Int)) (=> (and (<= 0 x) (<= 0 y)) (<= 0 (power x y)))))

;; Power_pos
  (assert
  (forall ((x Int) (y Int)) (=> (and (< 0 x) (<= 0 y)) (< 0 (power x y)))))

;; Power_monotonic
  (assert
  (forall ((x Int) (n Int) (m Int))
  (=> (and (< 0 x) (and (<= 0 n) (<= n m))) (<= (power x n) (power x m)))))

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

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int natural))))))
(declare-fun slide ((Array Int natural) Int Int) (Array Int natural))

;; slide_eq
  (assert
  (forall ((a (Array Int natural)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int natural)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int natural)) (a__first Int) (a__last Int)
  (b (Array Int natural)) (b__first Int)
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
  (forall ((a (Array Int natural)) (b (Array Int natural)))
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

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-sort fibonacci_index 0)

(declare-fun fibonacci_indexqtint (fibonacci_index) Int)

;; fibonacci_index'axiom
  (assert
  (forall ((i fibonacci_index))
  (and (<= 0 (fibonacci_indexqtint i)) (<= (fibonacci_indexqtint i) 30))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 30)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (fibonacci_index fibonacci_index) Bool)

(declare-const dummy2 fibonacci_index)

(declare-datatypes ((fibonacci_index__ref 0))
(((fibonacci_index__refqtmk (fibonacci_index__content fibonacci_index)))))
(define-fun fibonacci_index__ref_fibonacci_index__content__projection ((a fibonacci_index__ref)) fibonacci_index 
  (fibonacci_index__content a))

(declare-sort t16b 0)

(declare-fun t16bqtint (t16b) Int)

;; t16b'axiom
  (assert
  (forall ((i t16b)) (and (<= 2 (t16bqtint i)) (<= (t16bqtint i) 30))))

(define-fun in_range4 ((x Int)) Bool (and (<= 2 x) (<= x 30)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (t16b t16b) Bool)

(declare-const dummy3 t16b)

(declare-datatypes ((t16b__ref 0))
(((t16b__refqtmk (t16b__content t16b)))))
(define-fun t16b__ref_t16b__content__projection ((a t16b__ref)) t16b 
  (t16b__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant2 ((temp___expr_159 Int)
  (temp___is_init_155 Bool) (temp___skip_constant_156 Bool)
  (temp___do_toplevel_157 Bool)
  (temp___do_typ_inv_158 Bool)) Bool (=>
                                     (or (= temp___is_init_155 true)
                                     (<= 0 30)) (in_range3 temp___expr_159)))

(declare-const rliteral natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral) 0))

(declare-const rliteral1 natural)

;; rliteral_axiom
  (assert (= (naturalqtint rliteral1) 1))

(assert
;; defqtvc
 ;; File "array_applications.adb", line 59, characters 0-0
  (not
  (forall ((a (Array Int natural)) (a1 (Array Int natural))
  (a2 (Array Int natural)) (i Int) (o Int) (o1 Int))
  (=> (= a1 (store a 0 rliteral))
  (=> (= a2 (store a1 1 rliteral1))
  (=> (= i 2)
  (=> (= (and (ite (<= 2 i) true false) (ite (<= i 30) true false)) true)
  (=> (= (to_rep (select a2 (- i 2))) o)
  (=> (= (to_rep (select a2 (- i 1))) o1)
  (let ((o2 (+ o1 o)))
  (=> (in_range1 o2)
  (forall ((o3 natural))
  (=> (= (to_rep o3) o2)
  (forall ((a3 (Array Int natural)))
  (=> (= a3 (store a2 i o3))
  (forall ((o4 Int))
  (=> (= (to_rep (select a3 1)) o4)
  (forall ((o5 Int))
  (=> (= (to_rep (select a3 0)) o5)
  (forall ((a4 (Array Int natural)) (i1 Int))
  (=>
  (and
  (and (and (= (to_rep (select a4 0)) 0) (= (to_rep (select a4 1)) 1))
  (forall ((j Int))
  (=> (and (<= 2 j) (<= j i1))
  (= (to_rep (select a4 j)) (+ (to_rep (select a4 (- j 1))) (to_rep
                                                            (select a4 (- j 2))))))))
  (forall ((j Int))
  (=> (and (<= 0 j) (<= j i1))
  (and (<= 0 (to_rep (select a4 j))) (< (to_rep (select a4 j)) (power 2 j))))))
  (=>
  (= (and (ite (and (in_range4 i1)
               (forall ((temp___192 Int))
               (=> (and (<= 0 temp___192) (<= temp___192 30))
               (=>
               (or (< 30 temp___192) (or (< temp___192 2) (< i1 temp___192)))
               (= (select a4 temp___192) (select a2 temp___192))))))
          true false) (ite (and (<= 2 i1) (<= i1 30)) true false)) true)
  (=> (not (= i1 30))
  (forall ((i2 Int))
  (=> (= i2 (+ i1 1))
  (forall ((o6 Int))
  (=> (= (to_rep (select a4 (- i2 2))) o6)
  (forall ((o7 Int))
  (=> (= (to_rep (select a4 (- i2 1))) o7)
  (let ((o8 (+ o7 o6)))
  (=> (in_range1 o8)
  (forall ((o9 natural))
  (=> (= (to_rep o9) o8)
  (forall ((a5 (Array Int natural)))
  (=> (= a5 (store a4 i2 o9))
  (forall ((usf Int))
  (=> (= (and (ite (<= 2 usf) true false) (ite (<= usf i2) true false)) true)
  (let ((temp___195 (- usf 2)))
  (=> (and (<= 0 temp___195) (<= temp___195 30))
  (forall ((o10 Int))
  (=> (= (to_rep (select a5 temp___195)) o10)
  (let ((temp___194 (- usf 1)))
  (=> (and (<= 0 temp___194) (<= temp___194 30))
  (forall ((o11 Int))
  (=> (= (to_rep (select a5 temp___194)) o11)
  (=> (in_range1 (+ o11 o10)) (<= usf 30)))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)
(exit)
