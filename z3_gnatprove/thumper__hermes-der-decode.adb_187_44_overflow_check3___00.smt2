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

(declare-fun nth ((_ BitVec 8) Int) Bool)

(declare-fun lsr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun asr ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun lsl ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun abs1 ((x Int)) Int (ite (<= 0 x) x (- x)))

;; Abs_le
  (assert
  (forall ((x Int) (y Int)) (= (<= (abs1 x) y) (and (<= (- y) x) (<= x y)))))

;; Abs_pos
  (assert (forall ((x Int)) (<= 0 (abs1 x))))

(declare-fun rotate_right1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun rotate_left1 ((_ BitVec 8) Int) (_ BitVec 8))

(declare-fun pow2 (Int) Int)

(define-fun to_int1 ((x (_ BitVec 8))) Int (ite (bvsge x (_ bv0 8))
                                           (bv2int x) (- (- 256 (bv2int x)))))

(define-fun uint_in_range ((i Int)) Bool (and (<= 0 i) (<= i 255)))

(declare-fun nth_bv ((_ BitVec 8) (_ BitVec 8)) Bool)

(declare-fun eq_sub_bv ((_ BitVec 8) (_ BitVec 8) (_ BitVec 8)
  (_ BitVec 8)) Bool)

(define-fun eq_sub ((a (_ BitVec 8)) (b (_ BitVec 8)) (i Int)
  (n Int)) Bool (forall ((j Int))
                (=> (and (<= i j) (< j (+ i n))) (= (nth a j) (nth b j)))))

(declare-datatypes () ((t__ref (t__refqtmk (t__content (_ BitVec 8))))))
(declare-fun power ((_ BitVec 8) Int) (_ BitVec 8))

(define-fun bv_min ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) x y))

(define-fun bv_max ((x (_ BitVec 8))
  (y (_ BitVec 8))) (_ BitVec 8) (ite (bvule x y) y x))

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

(declare-sort octet 0)

(declare-const attr__ATTRIBUTE_MODULUS (_ BitVec 8))

(declare-fun attr__ATTRIBUTE_IMAGE3 ((_ BitVec 8)) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) (_ BitVec 8))

(declare-fun user_eq2 (octet octet) Bool)

(declare-const dummy2 octet)

(declare-datatypes () ((octet__ref (octet__refqtmk (octet__content octet)))))
(define-fun octet__ref_octet__content__projection ((a octet__ref)) octet 
  (octet__content a))

(declare-fun to_rep1 (octet) (_ BitVec 8))

(declare-fun of_rep1 ((_ BitVec 8)) octet)

;; inversion_axiom
  (assert
  (forall ((x octet))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert true)

;; coerce_axiom
  (assert
  (forall ((x (_ BitVec 8)))
  (! (= (to_rep1 (of_rep1 x)) x) :pattern ((to_rep1 (of_rep1 x))) )))

(define-fun to_int2 ((x octet)) Int (bv2int (to_rep1 x)))

;; range_int_axiom
  (assert
  (forall ((x octet)) (! (uint_in_range
  (to_int2 x)) :pattern ((to_int2 x)) )))

(declare-datatypes ()
((map__ref (map__refqtmk (map__content (Array Int octet))))))
(declare-fun slide ((Array Int octet) Int Int) (Array Int octet))

;; slide_eq
  (assert
  (forall ((a (Array Int octet)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int octet)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq ((a (Array Int octet)) (a__first Int) (a__last Int)
  (b (Array Int octet)) (b__first Int)
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
  (forall ((a (Array Int octet)) (b (Array Int octet)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep1 (select a temp___idx_154)) (to_rep1
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

(declare-datatypes () ((us_t (us_tqtmk (elts (Array Int octet))(rt t)))))
(define-fun to_array ((a us_t)) (Array Int octet) (elts a))

(define-fun of_array ((a (Array Int octet)) (f Int)
  (l Int)) us_t (us_tqtmk a (mk f l)))

(define-fun first1 ((a us_t)) Int (to_rep (first (rt a))))

(define-fun last1 ((a us_t)) Int (to_rep (last (rt a))))

(define-fun length ((a us_t)) Int (ite (<= (first1 a) (last1 a))
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

(declare-datatypes ()
((octet_array__ref (octet_array__refqtmk (octet_array__content us_t)))))
(define-fun octet_array__ref_octet_array__content__projection ((a octet_array__ref)) us_t 
  (octet_array__content a))

(declare-const message us_t)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const start Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-fun convert_length (Int Int) Int)

(declare-fun convert_length__function_guard (Int Int Int) Bool)

(declare-sort length_of_length_type 0)

(declare-fun length_of_length_typeqtint (length_of_length_type) Int)

;; length_of_length_type'axiom
  (assert
  (forall ((i length_of_length_type))
  (and (<= 1 (length_of_length_typeqtint i))
  (<= (length_of_length_typeqtint i) 127))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 127)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq4 (length_of_length_type length_of_length_type) Bool)

(declare-const dummy4 length_of_length_type)

(declare-datatypes ()
((length_of_length_type__ref
 (length_of_length_type__refqtmk
 (length_of_length_type__content length_of_length_type)))))
(define-fun length_of_length_type__ref_length_of_length_type__content__projection ((a length_of_length_type__ref)) length_of_length_type 
  (length_of_length_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_256 Int)
  (temp___is_init_252 Bool) (temp___skip_constant_253 Bool)
  (temp___do_toplevel_254 Bool)
  (temp___do_typ_inv_255 Bool)) Bool (=>
                                     (or (= temp___is_init_252 true)
                                     (<= 1 127)) (in_range3 temp___expr_256)))

;; convert_length__post_axiom
  (assert
  (forall ((starting Int) (octet_count Int))
  (! (=>
     (and
     (and (dynamic_invariant starting true true true true)
     (dynamic_invariant1 octet_count true true true true))
     (and
     (and
     (and (< (first1 message) starting)
     (<= (+ starting (- octet_count 1)) (last1 message))) (<= octet_count 4))
     (=> (= octet_count 4)
     (bvult (to_rep1 (select (to_array message) starting)) #x80))))
     (let ((result (convert_length starting octet_count)))
     (=> (convert_length__function_guard result starting octet_count)
     (dynamic_invariant result true false true true)))) :pattern ((convert_length
                                                                  starting
                                                                  octet_count)) )))

(declare-sort status_type 0)

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 6)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (status_type status_type) Bool)

(declare-const dummy5 status_type)

(declare-datatypes ()
((status_type__ref (status_type__refqtmk (status_type__content status_type)))))
(define-fun status_type__ref_status_type__content__projection ((a status_type__ref)) status_type 
  (status_type__content a))

(define-fun dynamic_invariant2 ((temp___expr_223 Int)
  (temp___is_init_219 Bool) (temp___skip_constant_220 Bool)
  (temp___do_toplevel_221 Bool)
  (temp___do_typ_inv_222 Bool)) Bool (=>
                                     (or (= temp___is_init_219 true)
                                     (<= 0 6)) (in_range4 temp___expr_223)))

(define-fun dynamic_invariant3 ((temp___expr_230 us_t)
  (temp___is_init_226 Bool) (temp___skip_constant_227 Bool)
  (temp___do_toplevel_228 Bool)
  (temp___do_typ_inv_229 Bool)) Bool (=>
                                     (not (= temp___skip_constant_227 true))
                                     (dynamic_property 0 2147483647
                                     (first1 temp___expr_230)
                                     (last1 temp___expr_230))))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant5 ((temp___expr_195 (_ BitVec 8))
  (temp___is_init_191 Bool) (temp___skip_constant_192 Bool)
  (temp___do_toplevel_193 Bool) (temp___do_typ_inv_194 Bool)) Bool true)

(declare-const stop Int)

(declare-const length1 Int)

(declare-const status Int)

(declare-const length_of_length Int)

;; Assume
  (assert (dynamic_invariant3 message true false true true))

;; Assume
  (assert (dynamic_invariant start true false true true))

;; Assume
  (assert (dynamic_invariant stop false false true true))

;; Assume
  (assert (dynamic_invariant length1 false false true true))

;; Assume
  (assert (dynamic_invariant2 status false false true true))

;; Assume
  (assert (and (<= (first1 message) start) (<= start (last1 message))))

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant1 length_of_length false false true true))

;; Assert
  (assert (and (<= (first1 message) start) (<= start (last1 message))))

(declare-const o (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array message) start)) o))

(declare-const spark__branch Bool)

;; H
  (assert (= spark__branch (ite (= o #x80) true false)))

;; H
  (assert (not (= spark__branch true)))

;; Assert
  (assert (and (<= (first1 message) start) (<= start (last1 message))))

(declare-const o1 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array message) start)) o1))

(declare-const spark__branch1 Bool)

;; H
  (assert (= spark__branch1 (ite (= (bvand o1 #x80) #x00) true false)))

;; H
  (assert (not (= spark__branch1 true)))

;; Assert
  (assert (and (<= (first1 message) start) (<= start (last1 message))))

(declare-const o2 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array message) start)) o2))

(declare-const spark__branch2 Bool)

;; H
  (assert (= spark__branch2 (ite (= o2 #xFF) true false)))

;; H
  (assert (not (= spark__branch2 true)))

;; Assert
  (assert
  (bvuge (bvsub (to_rep1 (select (to_array message) start)) #x80) #x01))

;; Assert
  (assert (not (= (to_rep1 (select (to_array message) start)) #x00)))

;; Assert
  (assert (and (<= (first1 message) start) (<= start (last1 message))))

(declare-const o3 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array message) start)) o3))

(define-fun o4 () Int (bv2int (bvand o3 #x7F)))

;; Ensures
  (assert (in_range3 o4))

(declare-const length_of_length1 Int)

;; H
  (assert (= length_of_length1 o4))

(define-fun o5 () Int (- (last1 message) length_of_length1))

;; Ensures
  (assert (in_range1 o5))

(declare-const spark__branch3 Bool)

;; H
  (assert (= spark__branch3 (ite (< o5 start) true false)))

;; H
  (assert (not (= spark__branch3 true)))

(define-fun o6 () Int (+ start 1))

;; Ensures
  (assert (in_range1 o6))

;; Assert
  (assert (and (<= (first1 message) o6) (<= o6 (last1 message))))

(declare-const o7 (_ BitVec 8))

;; Ensures
  (assert (= (to_rep1 (select (to_array message) o6)) o7))

(declare-const spark__branch4 Bool)

;; H
  (assert
  (= spark__branch4 (or (ite (< 4 length_of_length1) true false) (and 
  (ite (= length_of_length1 4) true false) (ite (bvuge o7 #x80) true false)))))

;; H
  (assert (not (= spark__branch4 true)))

(define-fun o8 () Int (+ start length_of_length1))

;; Ensures
  (assert (in_range1 o8))

(declare-const stop1 Int)

;; H
  (assert (= stop1 o8))

(define-fun o9 () Int (+ start 1))

(assert
;; defqtvc
 ;; File "hermes-der-decode.ads", line 44, characters 0-0
  (not (in_range1 o9)))
(check-sat)
