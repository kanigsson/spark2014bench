;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(declare-fun fibonacci (Int) Int)

(declare-fun fibonacci__function_guard (Int Int) Bool)

;; fibonacci__post_axiom
  (assert
  (forall ((n Int))
  (! (=> (and (dynamic_invariant n true true true true) (<= n 23))
     (let ((result (fibonacci n)))
     (=> (fibonacci__function_guard result n) (dynamic_invariant result true
     false true true)))) :pattern ((fibonacci n)) )))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const attr__ATTRIBUTE_ADDRESS7 Int)

(declare-const attr__ATTRIBUTE_ADDRESS8 Int)

(declare-const attr__ATTRIBUTE_ADDRESS9 Int)

(declare-const attr__ATTRIBUTE_ADDRESS10 Int)

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(declare-const n1 Int)

(declare-const n2 Int)

(declare-const l1 Int)

(declare-const l2 Int)

(declare-const a1 Int)

(declare-const a2 Int)

(declare-const b1 Int)

(declare-const b2 Int)

(declare-const i Int)

(declare-const copy_n1 Int)

(declare-const copy_n2 Int)

;; Assume
  (assert (dynamic_invariant n1 true false true true))

;; Assume
  (assert (dynamic_invariant n2 true false true true))

;; Assume
  (assert (dynamic_invariant l1 true false true true))

;; Assume
  (assert (dynamic_invariant l2 true false true true))

;; Assume
  (assert (and (and (= n1 n2) (= l1 l2)) (<= n1 23)))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant a1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant a2 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant b1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant b2 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant i false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant copy_n1 false false true true))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant copy_n2 false false true true))

(declare-const copy_n11 Int)

;; H
  (assert (= copy_n11 n1))

(declare-const copy_n21 Int)

;; H
  (assert (= copy_n21 n2))

(declare-const a11 Int)

;; H
  (assert (= a11 1))

(declare-const a21 Int)

;; H
  (assert (= a21 1))

(declare-const b11 Int)

;; H
  (assert (= b11 1))

(declare-const b21 Int)

;; H
  (assert (= b21 1))

(declare-const i1 Int)

;; H
  (assert (= i1 2))

(declare-const a12 Int)

(declare-const i2 Int)

;; H
  (assert (forall ((i3 Int)) (fibonacci__function_guard (fibonacci i3) i3)))

;; H
  (assert
  (forall ((i3 Int)) (fibonacci__function_guard (fibonacci (- i3 1))
  (- i3 1))))

;; H
  (assert (forall ((i3 Int)) (fibonacci__function_guard (fibonacci i3) i3)))

;; H
  (assert
  (forall ((i3 Int)) (fibonacci__function_guard (fibonacci (- i3 1))
  (- i3 1))))

;; H
  (assert
  (ite (< 2 n1)
  (let ((o (fibonacci i1)))
  (and
  (and (fibonacci__function_guard o i1) (dynamic_invariant o true false true
  true))
  (and
  (or (not (= a11 o))
  (let ((o1 (- i1 1)))
  (and (in_range2 o1)
  (let ((o2 (fibonacci o1)))
  (and (fibonacci__function_guard o2 o1) (dynamic_invariant o2 true false
  true true))))))
  (exists ((n11 Int) (a13 Int) (b12 Int) (i3 Int))
  (and
  (and
  (and (and (= a13 (fibonacci i3)) (= b12 (fibonacci (- i3 1)))) (<= i3 23))
  (= (- (+ n11 i3) 2) copy_n11))
  (and
  (= (and (ite (and
               (and
               (and (dynamic_invariant i3 false true true true)
               (dynamic_invariant a13 false true true true))
               (dynamic_invariant n11 true true true true))
               (dynamic_invariant b12 false true true true))
          true false) (ite (< 2 n11) true false)) true)
  (exists ((temp___197 Int))
  (and (= temp___197 n11)
  (let ((o1 (+ a13 b12)))
  (and (in_range1 o1)
  (and (= a12 o1)
  (let ((o2 (- a12 b12)))
  (and (in_range1 o2)
  (and (in_range2 o2)
  (exists ((b13 Int))
  (and (= b13 o2)
  (let ((o3 (- n11 1)))
  (and (in_range2 o3)
  (exists ((n12 Int))
  (and (= n12 o3)
  (let ((o4 (+ i3 1))) (and (in_range1 o4) (and (= i2 o4) (not (< 2 n12)))))))))))))))))))))))))
  (and (= a12 a11) (= i2 i1))))

(declare-const i3 Int)

;; H
  (assert (= i3 2))

(declare-const a22 Int)

;; H
  (assert (forall ((i4 Int)) (fibonacci__function_guard (fibonacci i4) i4)))

;; H
  (assert
  (forall ((i4 Int)) (fibonacci__function_guard (fibonacci (- i4 1))
  (- i4 1))))

;; H
  (assert (forall ((i4 Int)) (fibonacci__function_guard (fibonacci i4) i4)))

;; H
  (assert
  (forall ((i4 Int)) (fibonacci__function_guard (fibonacci (- i4 1))
  (- i4 1))))

;; H
  (assert
  (ite (< 2 n2)
  (let ((o (fibonacci i3)))
  (and
  (and (fibonacci__function_guard o i3) (dynamic_invariant o true false true
  true))
  (and
  (or (not (= a21 o))
  (let ((o1 (- i3 1)))
  (and (in_range2 o1)
  (let ((o2 (fibonacci o1)))
  (and (fibonacci__function_guard o2 o1) (dynamic_invariant o2 true false
  true true))))))
  (exists ((n21 Int) (a23 Int) (b22 Int) (i4 Int))
  (and
  (and
  (and (and (= a23 (fibonacci i4)) (= b22 (fibonacci (- i4 1)))) (<= i4 23))
  (= (- (+ n21 i4) 2) copy_n21))
  (and
  (= (and (ite (and
               (and
               (and (dynamic_invariant i4 false true true true)
               (dynamic_invariant a23 false true true true))
               (dynamic_invariant n21 true true true true))
               (dynamic_invariant b22 false true true true))
          true false) (ite (< 2 n21) true false)) true)
  (exists ((temp___205 Int))
  (and (= temp___205 n21)
  (let ((o1 (+ a23 b22)))
  (and (in_range1 o1)
  (and (= a22 o1)
  (let ((o2 (- a22 b22)))
  (and (in_range1 o2)
  (and (in_range2 o2)
  (exists ((b23 Int))
  (and (= b23 o2)
  (let ((o3 (- n21 1)))
  (and (in_range2 o3)
  (exists ((n22 Int))
  (and (= n22 o3)
  (let ((o4 (+ i4 1)))
  (and (in_range1 o4) (exists ((i5 Int)) (and (= i5 o4) (not (< 2 n22))))))))))))))))))))))))))
  (= a22 a21)))

(declare-const spark__branch Bool)

(declare-const l11 Int)

;; H
  (assert (= spark__branch (ite (< l1 a12) true false)))

;; H
  (assert (ite (= spark__branch true) (= l11 a12) (= l11 0)))

(declare-const l21 Int)

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (< l2 a22) true false)))

;; H
  (assert (ite (= spark__branch1 true) (= l21 a22) (= l21 0)))

(assert
;; defqtvc
 ;; File "fib.ads", line 12, characters 0-0
  (not (= l11 l21)))
(check-sat)