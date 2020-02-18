;; produced by cvc4_16.drv ;;
(set-logic AUFBVFPDTNIRA)
(set-info :smt-lib-version 2.6)
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

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(assert
;; defqtvc
 ;; File "constr.ads", line 4, characters 0-0
  (not
  (forall ((x (Array Int integer)) (i Int) (o Int))
  (=> (= (to_rep (select x 1)) 0)
  (=> (= i 1)
  (=> (= (to_rep (select x i)) o)
  (let ((o1 (+ o 1)))
  (=> (in_range o1)
  (forall ((o2 integer))
  (=> (= (to_rep o2) o1)
  (forall ((x1 (Array Int integer)))
  (=> (= x1 (store x i o2))
  (forall ((i1 Int))
  (=> (= i1 2)
  (forall ((o3 Int))
  (=> (= (to_rep (select x1 i1)) o3)
  (let ((o4 (+ o3 1)))
  (=> (in_range o4)
  (forall ((o5 integer))
  (=> (= (to_rep o5) o4)
  (forall ((x2 (Array Int integer)))
  (=> (= x2 (store x1 i1 o5))
  (forall ((i2 Int))
  (=> (= i2 3)
  (forall ((o6 Int))
  (=> (= (to_rep (select x2 i2)) o6)
  (let ((o7 (+ o6 1)))
  (=> (in_range o7)
  (forall ((o8 integer))
  (=> (= (to_rep o8) o7)
  (forall ((x3 (Array Int integer)))
  (=> (= x3 (store x2 i2 o8))
  (forall ((i3 Int))
  (=> (= i3 4)
  (forall ((o9 Int))
  (=> (= (to_rep (select x3 i3)) o9)
  (let ((o10 (+ o9 1)))
  (=> (in_range o10)
  (forall ((o11 integer))
  (=> (= (to_rep o11) o10)
  (forall ((x4 (Array Int integer)))
  (=> (= x4 (store x3 i3 o11))
  (forall ((i4 Int))
  (=> (= i4 5)
  (forall ((o12 Int))
  (=> (= (to_rep (select x4 i4)) o12)
  (let ((o13 (+ o12 1)))
  (=> (in_range o13)
  (forall ((o14 integer))
  (=> (= (to_rep o14) o13)
  (forall ((x5 (Array Int integer)))
  (=> (= x5 (store x4 i4 o14))
  (forall ((i5 Int))
  (=> (= i5 6)
  (forall ((o15 Int))
  (=> (= (to_rep (select x5 i5)) o15)
  (let ((o16 (+ o15 1)))
  (=> (in_range o16)
  (forall ((o17 integer))
  (=> (= (to_rep o17) o16)
  (forall ((x6 (Array Int integer)))
  (=> (= x6 (store x5 i5 o17))
  (forall ((i6 Int))
  (=> (= i6 7)
  (forall ((o18 Int))
  (=> (= (to_rep (select x6 i6)) o18)
  (let ((o19 (+ o18 1)))
  (=> (in_range o19)
  (forall ((o20 integer))
  (=> (= (to_rep o20) o19)
  (forall ((x7 (Array Int integer)))
  (=> (= x7 (store x6 i6 o20))
  (forall ((i7 Int))
  (=> (= i7 8)
  (forall ((o21 Int))
  (=> (= (to_rep (select x7 i7)) o21)
  (let ((o22 (+ o21 1)))
  (=> (in_range o22)
  (forall ((o23 integer))
  (=> (= (to_rep o23) o22)
  (forall ((x8 (Array Int integer)))
  (=> (= x8 (store x7 i7 o23))
  (forall ((i8 Int))
  (=> (= i8 9)
  (forall ((o24 Int))
  (=> (= (to_rep (select x8 i8)) o24)
  (let ((o25 (+ o24 1)))
  (=> (in_range o25)
  (forall ((o26 integer))
  (=> (= (to_rep o26) o25)
  (forall ((x9 (Array Int integer)))
  (=> (= x9 (store x8 i8 o26))
  (forall ((i9 Int))
  (=> (= i9 10)
  (forall ((o27 Int))
  (=> (= (to_rep (select x9 i9)) o27)
  (let ((o28 (+ o27 1)))
  (=> (in_range o28)
  (forall ((o29 integer))
  (=> (= (to_rep o29) o28)
  (forall ((x10 (Array Int integer)))
  (=> (= x10 (store x9 i9 o29)) (= (to_rep (select x10 1)) 1)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
(check-sat)